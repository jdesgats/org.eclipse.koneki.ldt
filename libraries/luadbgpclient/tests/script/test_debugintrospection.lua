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
--local introspection = require "debugger.introspection"
local introspection  = assert(loadfile("../debugger/introspection.lua"))()
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
  local dumped = introspection.make_property(0, { a = "foo", b = "bar" }, "testtable", nil, 1, 32, 0, nil, true)

  assert_string(dumped[1], "table string representation expected")
  assert_table_equal({
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
      {
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
      },
      {
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
    }, dumped)
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

-- stock Lua 5.1 cannot inspect function arguments
if _VERSION == "Lua 5.2" or jit then
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
