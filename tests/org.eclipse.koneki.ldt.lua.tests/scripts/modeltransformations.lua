-------------------------------------------------------------------------------
-- Copyright (c) 2012 Sierra Wireless and others.
-- All rights reserved. This program and the accompanying materials
-- are made available under the terms of the Eclipse Public License v1.0
-- which accompanies this distribution, and is available at
-- http://www.eclipse.org/legal/epl-v10.html
--
-- Contributors:
--     Sierra Wireless - initial API and implementation
-------------------------------------------------------------------------------

require 'errnode'
local serializer = require 'serpent'
local tablecompare         = require 'tablecompare'
local tabledumpbeautifier  = require 'tabledumpbeautifier'

--- @module modeltransformations
local M = {}

---
-- @function [parent=#modeltransformations] codetoserialisedmodel
-- @param #string sourcefilepath
-- @param #string resultextension
-- @param #function transformationfunction
function M.codetoserialisedmodel(sourcefilepath, resultextension, transformationfunction)

	-- Load file
	local luafile = io.open(sourcefilepath, 'r')
	local luasource = luafile:read('*a')
	luafile:close()

	-- Generate AST
	local ast, errormessage = getast( luasource )
	if not ast then
		return nil, string.format('Unable to generate AST for %s.\n%s', filename, errormessage)
	end
	
	--Generate model
	local model = transformationfunction(ast)

	-- Strip functions
		 model = tablecompare.stripfunctions( model )
 
		-- Serialize model
	local serializedcode = serializer.serialize( model )
	
	-- Beautify serialized model
	local beautifulserializedcode, error = tabledumpbeautifier.prettify(serializedcode)
	if not beautifulserializedcode then
		print(string.format("Unable to prettify serialized code.\n%s", error))
		beautifulserializedcode = serializedcode
	end
	 

	-- Define file name
	local extreplacement = table.concat({'%1.', resultextension})--string.format('\%1.%s', resultextension)
	local serializedfilename = sourcefilepath:gsub('([%w%-_/\]+)%.lua', extreplacement)

	-- Save serialized model
	local serializefile = io.open(serializedfilename, 'w')
	serializefile:write( beautifulserializedcode )
	serializefile:close()

	-- This a success
	print( string.format('%s serialized to %s.', sourcefilepath, serializedfilename) )
	return true
end
return M
