-------------------------------------------------------------------------------
-- Copyright (c) 2011 Sierra Wireless and others.
-- All rights reserved. This program and the accompanying materials
-- are made available under the terms of the Eclipse Public License v1.0
-- which accompanies this distribution, and is available at
-- http://www.eclipse.org/legal/epl-v10.html
--
-- Contributors:
--     Sierra Wireless - initial API and implementation
-------------------------------------------------------------------------------
-- Runtime inspection unit tests

--require("debugger")("moya.lan", 10000, nil, "core")

require "lunatest"
require "lunatest_xassert"
require "debugger" -- make debugger.introspection available in case of one-file build
require "debugger.platform".init() -- creates platform dependant functions
local introspection = require "debugger.introspection"
local util = require "debugger.util"

-- make base64 encoded strings more readable in error reports
util.b64 = function(s) return "<base64>"..s.."</base64>" end
util.rawb64 = util.b64
util.unb64 = function(s) return s:sub(9, -10) end

module(..., package.seeall)

local global_env
if setfenv then
  -- on Lua 5.1 sets the function environment to real global env (before module invocation)
  global_env = function(f) return setfenv(f, getfenv(0)) end
else
  global_env = function(f) return f end
end

-- Test basic type serialization
function test_basictype() -- skip() --
    assert_table_equal({
      tag = "property",
      attr = {
        children = 0,
        pagesize = 32,
        page = 0,
        type = "number",
        name = "foo",
        fullname = util.rawb64('0|(...)["foo"]'),
        encoding = "base64",
        size = 2,
      },
      util.b64("12")
    }, introspection.make_property(0, 12, "foo", nil, 1, 32, 0, nil, true))
    assert_equal('["foo"]', introspection.make_property(0, 12, "foo", nil, 1, 32, 0, nil, false).attr.name, "safe_name does not work as expected")
end

-- Strings are escaped
function test_string() -- skip() --
    local dumped = introspection.make_property(0, "a\nb\000c", "foo", nil, 1, 32, 0, nil, true)
    assert_equal("string", dumped.attr.type)
    -- %q behaves slightly differently depending on implementation
    assert_true(dumped.attr.size == 11       or dumped.attr.size == 9)
    assert_true(util.unb64(dumped[1]) == '"a\\nb\\000c"' or util.unb64(dumped[1]) == '"a\\nb\\0c"')
end

-- Simple table test
function test_table() -- skip() --
  local t = { a = "foo", b = "bar" }
  local dumped = introspection.make_property(0, t, "testtable", nil, 1, 32, 0, nil, true)

  assert_string(dumped[1], "table string representation expected")
  -- iteration order is not specified (and is totally unpredictible at least in Lua 5.2)
  local a = {
    tag = "property",
    attr = {
      children = 0,
      pagesize = 32,
      page = 0,
      type = "string",
      name = '["a"]',
      fullname = util.rawb64('0|(...)["testtable"]["a"]'),
      encoding = "base64",
      size = 5,
    },
    util.b64('"foo"')
  }
  local b = {
    tag = "property",
    attr = {
      children = 0,
      pagesize = 32,
      page = 0,
      type = "string",
      name = '["b"]',
      fullname = util.rawb64('0|(...)["testtable"]["b"]'),
      encoding = "base64",
      size = 5,
    },
    util.b64('"bar"')
  }
  
  local expected = {
    tag = "property",
    attr = {
      children = 1,
      numchildren = 2,
      pagesize = 32,
      page = 0,
      type = "table",
      name = "testtable",
      fullname = util.rawb64('0|(...)["testtable"]'),
      encoding = "base64",
      size = #util.unb64(dumped[1]),
    },
    dumped[1], -- result is unpredictible
  }
  
  if next(t) == "a" then
      expected[2], expected[3] = a, b
  else
      expected[2], expected[3] = b, a
  end
  
  assert_table_equal(expected, dumped)
end

-- Test table (array, actually) with metatable
function test_metatable() -- skip() --
    -- this metatable also define a string representation
    local mt = { __tostring = function(t) return string.format("(%d, %d)", unpack(t)) end }
    local t = setmetatable({ 12, 23 }, mt)
    local dumped = introspection.make_property(0, t, "testtable", nil, 2, 32, 0, nil, true)

    assert_equal("(12, 23)", util.unb64(dumped[1]))
    assert_equal("special", dumped[2].attr.type) -- metatable is set at first
    assert_equal('0|metatable[(...)["testtable"]]', util.unb64(dumped[2].attr.fullname))
    assert_table_subset({name='["__tostring"]', type="function (Lua)"}, dumped[2][2].attr)
    assert_table_subset({attr = {name='[1]', type='number'}, util.b64('12')}, dumped[3])
end

-- Test nested and recusive tables
function test_nested_recursive_table() -- skip() --
    local t = { nested = {} }
    t.nested.parent = t
    local dumped = introspection.make_property(0, t, "testtable", nil, 3, 32, 0, nil, true)
    assert_equal('["nested"]', dumped[2].attr.name)
    assert_equal('["parent"]', dumped[2][2].attr.name)
    assert_equal('["nested"]', dumped[2][2][2].attr.name)
    assert_nil(dumped[2][2][2][2], "recursion has not stopped where it should")
end

-- Test a basic function with one upvalue
function test_function() -- skip() --
    local a = 2
    local f = global_env(function() return a end)
    local finfo = debug.getinfo(f)
    local dumped = introspection.make_property(0, f, "testfunc", nil, 3, 32, 0, nil, true)

    assert_table_equal({
      children = 0,
      pagesize = 32,
      page = 0,
      type = "function (Lua)",
      name = "testfunc",
      fullname = util.rawb64('0|(...)["testfunc"]'),
      encoding = "base64",
      size = #util.unb64(dumped[1]),
    }, dumped.attr)

    local actual_repr = util.unb64(dumped[1])
    assert_match("^function.-\nfile://.-\n%d+$", actual_repr)
end

if setfenv then  -- Lua 5.2 does not have environments anymore
    function test_function_env() -- skip() --
        local f = setfenv(function() return a end, { a=12 })
        local dumped = introspection.make_property(0, f, "testfunc", nil, 3, 32, 0, nil, true)
        assert_table_subset({children=1, numchildren=1, type="function (Lua)"}, dumped.attr)
        assert_table_subset({name="environment", type="special", fullname=util.rawb64('0|environment[(...)["testfunc"]]'), children=1, numchildren=1}, dumped[2].attr)
        assert_table_subset({name='["a"]', type="number"}, dumped[2][2].attr)
    end
end

-- Test output for a function defined in C (using rawget, assuming that it has not been redefined)
function test_cfunction() -- skip() --
  local dumped = introspection.make_property(0, rawget, "testfunc", nil, 3, 32, 0, nil, true)
    assert_table_subset({ attr = {type="function"}, util.b64(tostring(rawget)) }, dumped)
end

-- test for function representation allowed by new Lua 5.2 debugging facilities
-- LuaJIT needs to be compiled with LUAJIT_ENABLE_LUA52COMPAT to allow this too
-- table.unpack is a new function for Lua 5.2 and is available on JIT only if
-- 5.2 features are enabled
if table.unpack then
    test_function_arguments = data_oriented_factory({
      { function() end, "function()" },
      { function(a, b) end, "function(a, b)" },
      { function(...) end, "function(...)" },
    },
    function(f, expected)
        local dumped = introspection.make_property(0, f, "testfunc", nil, 3, 32, 0, nil, true)
        assert_equal(expected, util.unb64(dumped[1]):match("(.-)\n"))
    end)
end

function test_pagination() -- skip --
  local t = { "value 1", "value 2", "value 3", "value 4", "value 5", "value 6", "value 7", "value 8", "value 9", "value 10", }
  local dumped
  -- query first page (0)
  dumped = introspection.make_property(0, t, "testtable", nil, 1, 3, 0, nil, true)
  assert_equal(4, #dumped) -- [1] is repr, next 3 are children
  assert_equal('"value 1"', util.unb64(dumped[2][1]))
  assert_equal('"value 3"', util.unb64(dumped[4][1]))

  -- query third page (2)
  dumped = introspection.make_property(0, t, "testtable", nil, 1, 3, 2, nil, true)
  assert_equal(4, #dumped) -- [1] is repr, next 3 are children
  assert_equal('"value 7"', util.unb64(dumped[2][1]))
  assert_equal('"value 9"', util.unb64(dumped[4][1]))

  -- 4th page is incomplete
  dumped = introspection.make_property(0, t, "testtable", nil, 1, 3, 3, nil, true)
  assert_equal(2, #dumped) -- [1] is repr, next is last children
  assert_equal('"value 10"', util.unb64(dumped[2][1]))

  -- non existant page
  dumped = introspection.make_property(0, t, "testtable", nil, 1, 3, 5, nil, true)
  assert_equal(1, #dumped) -- only repr is responed
end

function test_unsafe_name() -- skip() --
    local dumped

    dumped = introspection.make_property(0, 1, "foo", nil, 1, 32, 0, nil, false)
    assert_equal('["foo"]', dumped.attr.name)
    assert_equal('0|(...)["foo"]', util.unb64(dumped.attr.fullname))

    dumped = introspection.make_property(0, 1, "foo", 'metatable["foo"]', 1, 32, 0, nil, false)
    assert_equal('["foo"]', dumped.attr.name)
    assert_equal('0|metatable["foo"]', util.unb64(dumped.attr.fullname))
end

-- test plugins (metatable & probe based)
function test_mt_plugin() -- skip() --
    local mt = { }
    introspection.inspectors[mt] = function(name, value, parent, fullname)
        return introspection.property(name, "mytype", "my value", parent, fullname)
    end

    local t = { }
    introspection.add_probe(function(name, value, parent, fullname)
        if value == t then
            return introspection.property(name, "mytable", "found my table", parent, fullname)
        end
    end)

    local dumped = introspection.make_property(0, setmetatable({}, mt), "foo", nil, 1, 32, 0, nil, true)
    assert_equal(0, dumped.attr.children)
    assert_equal("mytype", dumped.attr.type)
    assert_equal(8, dumped.attr.size)
    assert_equal(util.b64("my value"), dumped[1])

    dumped = introspection.make_property(0, t, "foo", nil, 1, 32, 0, nil, true)
    assert_equal(0, dumped.attr.children)
    assert_equal("mytable", dumped.attr.type)
    assert_equal(14, dumped.attr.size)
    assert_equal(util.b64("found my table"), dumped[1])

    -- re-run some tests with plugins, they should not be affected
    test_metatable()
    test_table()
end

if jit and pcall(require, "debugger.plugins.ffi") then
    local ffi = require "ffi"
    local ffiplugin = require "debugger.plugins.ffi"

    -- structs
    ffi.cdef "struct point { double x, y; }"
    ffi.cdef "struct rectangle { struct point from, to; }"
    ffi.cdef "struct bitfield { signed a:4; unsigned b:3; }"
    local p = ffi.new "struct point"
    p.x, p.y = 10, 5
    local r = ffi.new "struct rectangle"
    r.from.x, r.from.y, r.to.x, r.to.y = 0, 0, 10, 12
    local bf = ffi.new "struct bitfield"
    bf.a, bf.b = 2, 3
    
    -- arrays
    local fla = ffi.new "int32_t[4]"
    local vla = ffi.new("int32_t[?]", 4)
    fla[0], fla[1], fla[2], fla[3] = 4, 8, 15, 16
    vla[0], vla[1], vla[2], vla[3] = 4, 8, 15, 16
    
    -- values with extra qualifiers
    local cui32 = ffi.new("const uint32_t", 12)
    local vfloat = ffi.new("volatile float", 10)
    
    -- functions (ANSI C functions are expected exist on target)
    ffi.cdef "char *strncpy(char *dest, const char *src, size_t n);"
    ffi.cdef "int printf(const char *format, ...);"
    ffi.cdef "void free(void *ptr);"
    -- typedefs are not returned exactly and size_t is architecture dependent
    local size_t = ffi.abi("64bit") and "uint64_t" or "uint32_t"
    
    -- enums
    ffi.cdef "enum MyEnum { Val01, Val02 }"
    ffi.cdef "typedef enum { ValAA=12, ValBB=15 } MyAnonymousEnum;"
    local myenum = ffi.new("enum MyEnum", ffi.C.Val01)
    local myanon = ffi.new("MyAnonymousEnum", 12)
    local myenum_unknown = ffi.new("enum MyEnum", 100)
    
    -- union
    ffi.cdef "union MyUnion { enum MyEnum e; int32_t i; };"
    local myunion = ffi.new("union MyUnion", ffi.C.Val02)
    
    -- ptr, ref
    local ptr = ffi.cast("int32_t *", 10) -- hopefully, introspection lib will not dereference it !
    local ref = r.to
    local nullref = ffi.cast("int32_t&", 0)
    
    -- type
    --TODO: reconstruct full definitions for structures ?
    local fla_t = ffi.typeof("int32_t[4]")
    local vla_t = ffi.typeof("int32_t[?]")

    -- the first numerical index is the string representation, which is not 
    -- always relevant (hence the nil value)
    test_cdata_introspection = data_oriented_factory({
    ---[[
      { p, { attr = { type = "struct point", children=1, numchildren=2, fullname = util.b64 '0|(...)["v"]' }, nil,
        { attr = { name = "x", type = "double", fullname = util.b64 '0|(...)["v"]["x"]' }, util.b64 "10" },
        { attr = { name = "y", type = "double", fullname = util.b64 '0|(...)["v"]["y"]' }, util.b64  "5"}}},
      { r, { attr = { type = "struct rectangle", numchildren=2 }, nil,
        { attr = { type = "struct point", name = "from" }, nil, { util.b64 "0" }, { util.b64 "0" } },
        { attr = { type = "struct point", name = "to"   }, nil, { util.b64 "10" }, { util.b64 "12" }}}},
      { bf, { attr = { type = "struct bitfield", numchildren=2 }, nil,
        { attr = { type = "signed:4",   name = "a" }, util.b64 "2" },
        { attr = { type = "unsigned:3", name = "b" }, util.b64 "3" }}},
      { fla, { attr = { type = "int32_t[4]", numchildren=4 }, nil, 
        { attr = { type = "int32_t", name="[0]" }, util.b64 "4" },
        { attr = { type = "int32_t", name="[1]" }, util.b64 "8" },
        { attr = { type = "int32_t", name="[2]" }, util.b64 "15" },
        { attr = { type = "int32_t", name="[3]" }, util.b64 "16" } }},
      { vla, { attr = { type = "int32_t[4]", numchildren=4 }, nil, 
        { attr = { type = "int32_t", name="[0]" }, util.b64 "4" },
        { attr = { type = "int32_t", name="[1]" }, util.b64 "8" },
        { attr = { type = "int32_t", name="[2]" }, util.b64 "15" },
        { attr = { type = "int32_t", name="[3]" }, util.b64 "16" } }},
      { cui32, { attr = { type = "const uint32_t", children=0 }, util.b64 "12" }},
      { vfloat, { attr = { type = "volatile float", children=0 }, util.b64 "10" }},
      { ffi.C.strncpy, { attr = { type = "function (FFI)", children=0 }, 
                        util.b64("int8_t* strncpy(int8_t* dest, const int8_t* src, "..size_t.." n)") } },
      { ffi.C.printf,  { attr = { type = "function (FFI)", children=0 }, 
                        util.b64("int32_t printf(const int8_t* format, ...)") } },
      { ffi.C.free,    { attr = { type = "function (FFI)", children=0 }, 
                        util.b64("void free(void* ptr)") } },
      { myenum, { attr = { type = "enum MyEnum", children=0 }, util.b64("Val01") } },
      { myanon, { attr = { type = "anonymous enum", children=0 }, util.b64("ValAA") } },
      { myenum_unknown, { attr = { type = "enum MyEnum", children=0 }, util.b64("100") } },
      { myunion, { attr = { type = "union MyUnion", children=1, numchildren=2 }, nil, 
        { attr = { type = "enum MyEnum", name = "e" }, util.b64("Val02") },
        { attr = { type = "int32_t",     name = "i" }, util.b64("1") }}},
      { ptr, { attr = { type = "int32_t*", children=0 }, nil } },
      { ref, { attr = { type = "const struct point&", children=1, numchildren=2 }, nil,
        { util.b64 "10" }, { util.b64 "12" } } },
      { ref, { attr = { type = "const struct point&", children=0 } }, true },
      -- currently this causes a segmentation fault !!!
      --{ nullref, { attr = { type = "const int32_t&", children=0 } } },
      { fla_t, { attr = { type = "ctype", children=0 } } },
      { vla_t, { attr = { type = "ctype", children=0 } } },
      --]]
    },
    function(value, expected, unsafe_ref)
        ffiplugin.inspect_references = not unsafe_ref
        local dumped = introspection.make_property(0, value, "v", nil, 4, 32, 0, nil, true)
        --dump_value(dumped); print(string.rep("-", 80) .. "\n\n")
        assert_table_subset(expected, dumped)
    end)
end

