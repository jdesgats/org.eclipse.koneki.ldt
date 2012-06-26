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

function M.test(modelsourcepath, serializedreferencepath)

	--
	-- Load provided model
	--
	local luafile, errormessage = io.open(modelsourcepath, 'r')
	assert(
		luafile,
		string.format('Unable to read from %s.\n%s', modelsourcepath, errormessage or '')
	)
	local inputstring = luafile:read('*a')
	luafile:close()
	
	-- Load model
	local modelfunction = loadstring(inputstring)
	local inputmodel = modelfunction()

	-- Generate html
	local inputhtml = templateengine.applytemplate(inputmodel)
	
	-- Create parser for input html
	local handler = domhandler.createhandler()
	local xmlparser = xml.newparser(handler)
	xmlparser.options.stripWS = false
	local errorhandlingfunction, errormessages = errorhandling(modelsourcepath)
	xmlparser.options.errorHandler = errorhandlingfunction
	
	-- Actual html parsing
	local status, pcallerror = pcall( function() 
		xmlparser:parse(inputhtml)
	end)
	assert(#errormessages == 0 and status, string.format("%s\n%s",table.concat(errormessages), tostring(pcallerror)))
	local htmltable = handler.root

	--
	-- Load provided reference
	--
	local reffile = io.open(serializedreferencepath, 'r')
	local htmlreference = reffile:read(('*a'))
	reffile:close()
	
	-- Create parser for generated html
	handler = domhandler.createhandler()
	xmlparser = xml.newparser(handler)
	xmlparser.options.stripWS = false
	errorhandlingfunction, errormessages = errorhandling(modelsourcepath)
	xmlparser.options.errorHandler = errorhandlingfunction
	
	-- Generate html from reference
	errormessages = {}
	local status, pcallerror = pcall( function() 
		xmlparser:parse(htmlreference)
	end)
	assert(#errormessages == 0 and status, string.format("%s\n%s",table.concat(errormessages), tostring(pcallerror)))
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
		local firstout   = string.format('%s\nGenerated HTML\n%s\n%s', line, line, inputhtml)
		local secondout  = string.format('%s\nReference HTML\n%s\n%s', line, line, htmlreference)
		local firsthtml   = string.format('%s\nGenerated table\n%s\n%s', line, line, table.tostring(htmltable, 1))
		local secondhtml  = string.format('%s\nReference table\n%s\n%s', line, line, table.tostring(htmlreferencetable, 1))
		return nil, string.format('Keys which differ are:\n%s\n%s\n%s\n%s\n%s', differentkeysstring, firstout, secondout, firsthtml, secondhtml)
	end
	return true
end
return M
