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
local domhandler      = require 'domhandler'
local tablecompare    = require 'tablecompare'
local templateengine  = require 'templateengine'
local xml = require 'xml'

--
-- Loading template engine environment
--
for key, value in pairs(require 'template.utils') do
	templateengine.env[key] = value
end

local M = {}
local errorhandling = function (filename)
	local errorbuffer = {}
	return function (err, offset)
		local message = string.format(
			"An error occured while generating html for %s at offset %d.\n%s",
			filename,
			offset,
			err
		)
		table.insert(errorbuffer, message)
	end, errorbuffer
end
function M.test(luasourcepath, serializedreferencepath)

	--
	-- Load provided source
	--
	local luafile, errormessage = io.open(luasourcepath, 'r')
	assert(
		luafile,
		string.format('Unable to read from %s.\n%s', luasourcepath, errormessage or '')
	)
	local luasource = luafile:read('*a')
	luafile:close()

	-- Generate AST
	local ast, errormessage = getast( luasource )
	assert(
		ast,
		string.format('Unable to generate AST for %s.\n%s', luasourcepath, errormessage or '')
	)

	-- Generate API model
	local apimodel = apimodelbuilder.createmoduleapi(ast)
	
	-- Generate html form API Model
	local htmlcode, errormessage = templateengine.applytemplate(apimodel)
	assert(
		htmlcode,
		string.format('Unable to generate html for %s.\%s', luasourcepath, errormessage or '')
	)

	--
	-- Generate html table
	--
	
	-- Create parser for generated html
	local handler = domhandler.createhandler()
	local xmlparser = xml.newparser(handler)
	xmlparser.options.stripWS = false
	local errorhandlingfunction, errormessages = errorhandling(luasourcepath)
	xmlparser.options.errorHandler = errorhandlingfunction
	
	-- Actual html parsing
    xmlparser:parse(htmlcode)
    assert(#errormessages == 0, table.concat(errormessages))
    local htmltable = handler.root

	--
	-- Load provided reference
	--
	local reffile = io.open(serializedreferencepath, 'r')
	htmlreferencecode = reffile:read(('*a'))
	reffile:close()
	
	-- Generate html from reference
	errormessages = {}
    xmlparser:parse(htmlreferencecode)
    assert(#errormessages == 0, table.concat(errormessages))
    local htmlreferencetable = handler.root
	

	-- Check that they are equivalent
	local equivalent = tablecompare.compare(htmltable, htmlreferencetable)
	if #equivalent > 0 then

		-- Compute which keys differs
		local differentkeys = tablecompare.diff(htmltable, htmlreferencetable)
		local differentkeysstring = table.tostring(differentkeys)
		
		-- Formalise first table output
		local _ = '_'
		local line = _:rep(80)
		local firstout   = string.format('%s\nFirst table\n%s\n%s', line, line, table.tostring(htmltable, 1))
		local secondout  = string.format('%s\nSecond table\n%s\n%s', line, line, table.tostring(htmlreferencetable, 1))
		return nil, string.format('Keys which differ are:\n%s\n%s\n%s', differentkeysstring, firstout, secondout)

	end
	return true
end
return M
