	do local _ = {
		description = "",
		globalvars = {

		}
		--[[table: 0x84126c8]],
		shortdescription = "",
		name = "modulename",
		returns = {
			{
				types = {
					{
						typename = "modulename",
						tag = "internaltyperef"
					}
					--[[table: 0x85939b0]]
				}
				--[[table: 0x84bcc68]],
				description = "",
				tag = "return"
			}
			--[[table: 0x84bbb78]]
		}
		--[[table: 0x850e9b8]],
		types = {
		["__=#string[paramname]__1"] = {
				shortdescription = " Function short description\010 Function long description\010 ",
				description = "",
				name = "__=#string[paramname]__1",
				parent = nil --[[ref]],
				returns = {

				}
				--[[table: 0x844abf8]],
				params = {
					{
						description = "param description",
						type = {
							typename = "string",
							tag = "primitivetyperef"
						}
						--[[table: 0x8464338]],
						name = "paramname",
						tag = "parameter"
					}
					--[[table: 0x846ef10]]
				}
				--[[table: 0x84c1cf8]],
				tag = "functiontypedef"
			}
			--[[table: 0x8525310]],
			modulename = {
				fields = {
					functionname = {
						type = {
							typename = "__=#string[paramname]__1",
							tag = "internaltyperef"
						}
						--[[table: 0x8416b30]],
						description = "",
						parent = nil --[[ref]],
						shortdescription = " Function short description\010 Function long description\010 ",
						name = "functionname",
						sourcerange = {
							min = 25,
							max = 182
						}
						--[[table: 0x8524518]],
						occurrences = {

						}
						--[[table: 0x84a8878]],
						tag = "item"
					}
					--[[table: 0x835d818]]
				}
				--[[table: 0x84bd638]],
				name = "modulename",
				parent = nil --[[ref]],
				sourcerange = {
					min = 1,
					max = 23
				}
				--[[table: 0x8493f58]],
				tag = "recordtypedef"
			}
			--[[table: 0x84bcd78]]
		}
		--[[table: 0x83eb580]],
		tag = "file"
	}
	--[[table: 0x8593690]];
	_.types["__=#string[paramname]__1"].parent = _;
	_.types.modulename.fields.functionname.parent = _.types.modulename;
	_.types.modulename.parent = _;
	return _;
	end