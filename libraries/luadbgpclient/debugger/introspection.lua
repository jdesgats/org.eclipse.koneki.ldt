-------------------------------------------------------------------------------
-- Copyright (c) 2011-2012 Sierra Wireless and others.
-- All rights reserved. This program and the accompanying materials
-- are made available under the terms of the Eclipse Public License v1.0
-- which accompanies this distribution, and is available at
-- http://www.eclipse.org/legal/epl-v10.html
--
-- Contributors:
--     Sierra Wireless - initial API and implementation
-------------------------------------------------------------------------------
-- Properties generation. Generate a LOM table with data from introspection.
-------------------------------------------------------------------------------

local debug = require "debug"
local platform = require "debugger.platform"
local util = require "debugger.util"

local tostring, type, assert, next, rawget, getmetatable, setmetatable, getfenv, select,         coyield,         cocreate,         costatus,         coresume,       sformat,      tconcat =
      tostring, type, assert, next, rawget, getmetatable, setmetatable, getfenv, select, coroutine.yield, coroutine.create, coroutine.status, coroutine.resume, string.format, table.concat

local MULTIVAL_MT = { __tostring = function() return "" end }

local M = { }
M.inspectors = { }
M.property = coyield

M.inspect = function(name, value, parent, fullname)
    return (M.inspectors[type(value)] or M.inspectors.default)(name, value, parent, fullname)
end

local function default_inspector(name, value, parent, fullname)
    return M.property(name, type(value), tostring(value), parent, fullname)
end

-- Inspects types that can have a metatable (table and userdata). Returns
--   1) generated property
--   2) boolean indicating whether a custom inspector has been called (in that case, do not process value any further)
local function metatable_inspector(name, value, parent, fullname)
    local mt = getmetatable(value)
    do
        local custom = M.inspectors[mt]
        if custom then return custom(name, value, parent, fullname), true end
    end
    
    local prop = default_inspector(name, value, parent, fullname)
    if mt and prop then
        local mtprop = M.inspect("metatable", mt, prop, "metatable["..prop.attr.fullname.."]")
        if mtprop then mtprop.attr.type = "special" end
    end
    return prop, false
end

M.inspectors.number   = default_inspector
M.inspectors.string   = default_inspector
M.inspectors.boolean  = default_inspector
M.inspectors["nil"]   = default_inspector
M.inspectors.userdata = default_inspector
M.inspectors.thread   = default_inspector
M.inspectors.default  = default_inspector -- allows 3rd party inspectors to use the default inspector if needed

M.inspectors.userdata = function(name, value, parent, fullname)
    return (metatable_inspector(name, value, parent, fullname)) -- drop second return value
end

M.inspectors.string = function(name, value, parent, fullname)
    -- escape linebreaks as \n and not as \<0x0A> like %q does
    return M.property(name, "string", sformat("%q", value):gsub("\\\n", "\\n"), parent, fullname)
end

local function fancy_func_repr(f, info)
    local args = {}
    for i=1, info.nparams do
        args[i] = debug.getlocal(f, i)
    end

    if info.isvararg then
        args[#args+1] = "..."
    end

    return "function(" .. tconcat(args, ", ") .. ")"
end

M.inspectors["function"] = function(name, value, parent, fullname)
    local info = debug.getinfo(value, "nSflu")
    local prop
    if info.what ~= "C" then
        -- try to create a fancy representation if possible
        local repr = info.nparams and fancy_func_repr(value, info) or tostring(value)
        if info.source:sub(1,1) == "@" then
            repr = repr .. "\n" .. platform.get_uri("@" .. info.source) .. "\n" .. tostring(info.linedefined)
        end
        prop = M.property(name, "function (Lua)", repr, parent, fullname)
    else
        prop = M.property(name, "function", tostring(value), parent, fullname)
    end
    if not prop then return nil end
    
    -- (5.1 only) environment is dumped only if it is different from global environment
    -- TODO: this is not a correct behavior: environment should be dumped if is different from current stack level one
    local fenv = getfenv and getfenv(value)
    if fenv and fenv ~= getfenv(0) then
        local fenvprop = M.inspect("environment", fenv, prop, "environment["..prop.attr.fullname.."]")
        if fenvprop then fenvprop.attr.type = "special" end
    end
    
    return prop
end

local function generate_printable_key(name)
    return "[" .. (type(name) == "string" and sformat("%q", name) or tostring(name)) .. "]"
end

local function generate_key(name)
    local tname = type(name)
    if tname == "string" then return sformat("%q", name)
    elseif tname == "number" or tname == "boolean" then return tostring(name)
    else -- complex key, use key_cache for lookup
        local i = M.key_cache.n
        M.key_cache[i] = name
        M.key_cache.n = i+1
        return "key_cache["..tostring(i).."]"
    end
end

M.inspectors.table = function(name, value, parent, fullname)
    local prop, iscustom = metatable_inspector(name, value, parent, fullname)
    if not prop or iscustom then return prop end
    
    -- iterate over table values and detect arrays at the same time
    -- next is used to circumvent __pairs metamethod in 5.2
    local isarray, i = true, 1
    for k,v in next, value, nil do
        M.inspect(generate_printable_key(k), v, prop, fullname .. "[" .. generate_key(k) .. "]")
        -- array detection: keys should be accessible by 1..n keys
        isarray = isarray and rawget(value, i) ~= nil
        i = i + 1
    end
    -- empty tables are considered as tables
    if isarray and i > 1 then prop.attr.type = "sequence" end
    
    return prop
end

--TODO: whait fullname should be (as returned properties are read only)
M.inspectors[MULTIVAL_MT] = function(name, value, parent, fullname)
    if value.n == 1 then
        -- return directly the value as result
        return M.inspect(name, value[1], parent, fullname)
    else
        -- wrap values inside a multival container
        local prop = M.property(name, "multival", "", parent, fullname)
        if not prop then return nil end
        for i=1, value.n do
            M.inspect(generate_printable_key(i), value[i], prop, fullname .. "[" .. i .. "]")
        end
        return prop
    end
end

-- ----------------------------------------------------------------------------
-- Public API.
-- ----------------------------------------------------------------------------

-- Used to store complex keys (other than string and number) as they cannot be passed in text
-- For these keys, the resulting expression will not be the key itself but "key_cache[...]"
-- where key_cache must be mapped to this table to resolve key correctly.
M.key_cache = setmetatable({ n=0 }, { __mode = "v" })

-- Used to inspect "multival" or "vararg" values. The typical use is to pack function result(s) in a single
-- value to inspect. The Multival instances can be passed to make_property as a single value, they will be
-- correctly reported to debugger
function M.Multival(...)
    return setmetatable({ n=select("#", ...), ... }, MULTIVAL_MT)
end

--- Makes a property form a name/value pair (and fullname), see DBGp spec 7.11 for details
-- It has a pretty basic handling of complex types (function, table, userdata), relying to Lua Inspector for advanced stuff.
-- @param cxt_id (number) context ID in which this value resides (workaround bug 352316)
-- @param value (any) the value to debug
-- @param name (any) the name associated with value, passed through tostring
-- @param fullname (string) a Lua expression to eval to get that property again (if nil, computed automatically)
-- @param depth (number) the maximum property depth (recursive calls)
-- @param pagesize (number) maximum children to include
-- @param page (number) the page to generate (0 based)
-- @param size_limit (number, optional) if set, the maximum size of the string representation (in bytes)
-- @param safe_name (boolean) if true, does not encode the name as table key
--TODO BUG ECLIPSE TOOLSLINUX-99 352316 : as a workaround, context is encoded into the fullname property
M.make_property = function(cxt_id, value, name, fullname, depth, pagesize, page, size_limit, safe_name)
    fullname = fullname or "(...)[" .. generate_key(name) .. "]"
    if not safe_name then name = generate_printable_key(name) end

    local generator = cocreate(function() return M.inspect(name, value, nil, fullname) end)
    local propstack = { }
    local rootnode
    local catchthis = true
    local nodestoskip = page * pagesize -- nodes to skip at root level to respect pagination
    local fullname_prefix = tostring(cxt_id).."|"

    --TODO pagination (donner nil si c'est pas la peine d'aller plus loin, y compris pour depth), metatablses et autres trucs, optimisation (essayer de virer propstack)
    while true do
        local succes, name, datatype, repr, parent, fullname = assert(coresume(generator, catchthis and propstack[#propstack] or nil))
        -- finalize and pop all finished properties
        while propstack[#propstack] ~= parent do
            local topop = propstack[#propstack]
            topop.attr.fullname = util.rawb64(fullname_prefix .. topop.attr.fullname)
            propstack[#propstack] = nil
        end
        if costatus(generator) == "dead" then break end

        local prop = {
          tag = "property",
          attr = {
            children = 0,
            pagesize = pagesize,
            page = parent and 0 or page,
            type = datatype,
            name = name,
            fullname = fullname,
            encoding = "base64",
            size = #repr,
          },
          util.b64(size_limit and repr:sub(1, size_limit) or repr)
        }
        
        if parent then
            parent.attr.children = 1
            parent.attr.numchildren = (parent.attr.numchildren or 0) + 1
            -- take pagination into accont to know if node needs to be catched
            catchthis = #parent <= pagesize and #propstack <= depth
            if parent == rootnode then
                catchthis = catchthis and nodestoskip <= 0
                nodestoskip = nodestoskip - 1
            end
            -- add node to tree
            if catchthis then
              parent[#parent + 1] = prop
              propstack[#propstack + 1] = prop
            end
        else
            rootnode = prop
            catchthis = true
            propstack[#propstack + 1] = prop
        end
    end

    return rootnode
end

return M
