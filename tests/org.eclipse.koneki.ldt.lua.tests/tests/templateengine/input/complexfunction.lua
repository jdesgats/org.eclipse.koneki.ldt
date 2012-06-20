---
-- Complex Function to process
-- @module complexfunction
local string = require 'string'

local M = {}

---
-- Foo function title.
-- Long foo description here. Can be on several lines.
-- Like that.
-- @function [parent=#complexfunction] foo
-- @param #string param1 Full param description here
-- @param param2 Param2 description
-- @return #string must return "a", must return two
function M.foo(param1, param2)
	return "a",2
end

return M
