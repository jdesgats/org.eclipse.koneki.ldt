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
local apimodelbuilder = require 'models.apimodelbuilder'
local tablecompare = require 'tablecompare'
require 'metalua.compiler'
local domhandler = require 'domhandler'
local xml = require 'xml'
local assert = java.require("org.junit.Assert")

local templateengine = require 'templateengine'
for k, v in pairs(require 'template.utils') do
	templateengine.env[k] = v
end

local M = {}

local function errorhandlergen(file)
	return function (err, pos)
			local str = string.format("Parsing error of %s,line %i: %s",file, pos, err)
			assert:fail(str)
		end
end


function M.test(luasourcepath, referencepath)

	-- Load provided source
	local luafile, errormessage = io.open(luasourcepath, 'r')
	if not luafile then
		return nil, string.format('Unable to read from %s.\n%s', luasourcepath, errormessage)
	end
	local luasource = luafile:read('*a')
	luafile:close()

	-- Generate AST
	local ast, errormessage = getast( luasource )
	if not ast then
		return nil, string.format('Unable to generate AST for %s.\n%s', luasourcepath, errormessage)
	end

	-- Generate API model
	local apimodel = apimodelbuilder.createmoduleapi(ast)

	-- Generate Documentation
	local docGenerated = templateengine.applytemplate(apimodel)

	-- Create parser for generated html
	local h = domhandler.createhandler()
	local xmlparser = xml.newparser(h)
	xmlparser.options.stripWS = nil
	local parsingError = string.format("generated HTML file:\n%s\n", docGenerated)
	xmlparser.options.errorHandler = errorhandlergen(parsingError)

	-- Parse the HTML in a table
    xmlparser:parse(docGenerated)
    local docGeneratedTable = h.root;
    

	-- Load provided reference
	local referenceFile, errormessage = io.open(referencepath)
	if not referenceFile then
		return nil, string.format('Unable to read reference from %s.\n%s', luareferencepath, errormessage)
	end
	local referencehtml = referenceFile:read('*a')

 	-- Create reference parser
	h = domhandler.createhandler()
	xmlparser = xml.newparser(h)
	xmlparser.options.stripWS = nil
	xmlparser.options.errorHandler = errorhandlergen(referencepath)
	
	-- Parse reference in a table
	xmlparser:parse(referencehtml)
	local referencetable = h.root;

	-- Check that they are equivalent
	local equivalent = tablecompare.compare(docGeneratedTable, referencetable)
	if #equivalent > 0 then

		-- Compute which keys differs
		local differentkeys = tablecompare.diff(docGeneratedTable, referencetable)
		local differentkeysstring = table.tostring(differentkeys)

		-- Formalise output
		local _ = '_'
		local line = _:rep(80)
		local firstout   = string.format('%s\nGenerated HTML\n%s\n%s', line, line, docGenerated)
		local secondout  = string.format('%s\nReference HTML\n%s\n%s', line, line, referencehtml)
		local firsthtml   = string.format('%s\nGenerated table\n%s\n%s', line, line, table.tostring(docGeneratedTable, 1))
		local secondhtml  = string.format('%s\nReference table\n%s\n%s', line, line, table.tostring(referencetable, 1))
		return nil, string.format('Keys which differ are:\n%s\n%s\n%s\n%s\n%s', differentkeysstring, firstout, secondout, firsthtml, secondhtml)

	end
	return true
end

return M
