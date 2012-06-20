---
-- Module to process
-- @module multifunction
local string = require 'string'

local M = {}

---
-- Foo function
-- @function [parent=#multifunction] foo
function M.foo()
	print("y")
end

---
-- Foo2 function
-- @function [parent=#multifunction] foo2
function M.foo2()
	print("y")
end

---
-- Foo3 function
-- @function [parent=#multifunction] foo3
function M.foo3()
	print("y")
end

return M
