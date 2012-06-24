	do local _ = {
		description = "",
		globalvars = {

		}
		--[[table: 0x8c0efa0]],
		shortdescription = "",
		name = "modulename",
		returns = {
			{
				types = {
					{
						typename = "modulename",
						tag = "internaltyperef"
					}
					--[[table: 0x89b95f8]]
				}
				--[[table: 0x8ab5850]],
				description = "",
				tag = "return"
			}
			--[[table: 0x88e8120]]
		}
		--[[table: 0x88bf498]],
		types = {
			modulename = {
				fields = {
					fieldname = {
						type = {
							typename = "typename",
							modulename = "externmodulename",
							tag = "externaltyperef"
						}
						--[[table: 0x8c8a750]],
						description = "",
						parent = nil --[[ref]],
						shortdescription = "",
						name = "fieldname",
						sourcerange = {
							min = 27,
							max = 97
						}
						--[[table: 0x8b76950]],
						occurrences = {

						}
						--[[table: 0x8a02328]],
						tag = "item"
					}
					--[[table: 0x85ea360]]
				}
				--[[table: 0x87a2e90]],
				name = "modulename",
				parent = nil --[[ref]],
				sourcerange = {
					min = 1,
					max = 24
				}
				--[[table: 0x85ed5a0]],
				tag = "recordtypedef"
			}
			--[[table: 0x87b4d90]]
		}
		--[[table: 0x8b4a850]],
		tag = "file"
	}
	--[[table: 0x8b15418]];
	_.types.modulename.fields.fieldname.parent = _.types.modulename;
	_.types.modulename.parent = _;
	return _;
	end