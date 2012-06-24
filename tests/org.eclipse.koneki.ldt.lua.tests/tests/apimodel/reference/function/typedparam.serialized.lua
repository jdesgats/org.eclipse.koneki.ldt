	do local _ = {
		description = "",
		globalvars = {

		}
		--[[table: 0x848cf48]],
		shortdescription = "",
		name = "modulename",
		returns = {
			{
				types = {
					{
						typename = "modulename",
						tag = "internaltyperef"
					}
					--[[table: 0x871e470]]
				}
				--[[table: 0x85012c0]],
				description = "",
				tag = "return"
			}
			--[[table: 0x848ea38]]
		}
		--[[table: 0x84091a0]],
		types = {
		["__=#string[paramname]__1"] = {
				shortdescription = " Function short description\010 Function long description\010 ",
				description = "",
				name = "__=#string[paramname]__1",
				parent = nil --[[ref]],
				returns = {

				}
				--[[table: 0x8696700]],
				params = {
					{
						description = "",
						type = {
							typename = "string",
							tag = "primitivetyperef"
						}
						--[[table: 0x87392b0]],
						name = "paramname",
						tag = "parameter"
					}
					--[[table: 0x85f18f8]]
				}
				--[[table: 0x8799ec0]],
				tag = "functiontypedef"
			}
			--[[table: 0x84aae50]],
			modulename = {
				fields = {
					functionname = {
						type = {
							typename = "__=#string[paramname]__1",
							tag = "internaltyperef"
						}
						--[[table: 0x86bc2e0]],
						description = "",
						parent = nil --[[ref]],
						shortdescription = " Function short description\010 Function long description\010 ",
						name = "functionname",
						sourcerange = {
							min = 25,
							max = 164
						}
						--[[table: 0x84aadc8]],
						occurrences = {

						}
						--[[table: 0x85f6d30]],
						tag = "item"
					}
					--[[table: 0x8677908]]
				}
				--[[table: 0x84d05e0]],
				name = "modulename",
				parent = nil --[[ref]],
				sourcerange = {
					min = 1,
					max = 23
				}
				--[[table: 0x865dbc0]],
				tag = "recordtypedef"
			}
			--[[table: 0x8502e48]]
		}
		--[[table: 0x848ceb8]],
		tag = "file"
	}
	--[[table: 0x8487e38]];
	_.types["__=#string[paramname]__1"].parent = _;
	_.types.modulename.fields.functionname.parent = _.types.modulename;
	_.types.modulename.parent = _;
	return _;
	end