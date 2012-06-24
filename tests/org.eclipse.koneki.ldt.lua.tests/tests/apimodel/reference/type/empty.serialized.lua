	do local _ = {
		description = "",
		globalvars = {

		}
		--[[table: 0x87493d8]],
		shortdescription = "",
		name = "modulename",
		returns = {
			{
				types = {
					{
						typename = "modulename",
						tag = "internaltyperef"
					}
					--[[table: 0x87492a0]]
				}
				--[[table: 0x89612d0]],
				description = "",
				tag = "return"
			}
			--[[table: 0x88b5cf8]]
		}
		--[[table: 0x885efe0]],
		types = {
			typename = {
				description = "",
				fields = {

				}
				--[[table: 0x8650540]],
				name = "typename",
				shortdescription = " Type short description\r\010 Type long description\r\010 ",
				parent = nil --[[ref]],
				sourcerange = {
					min = 27,
					max = 103
				}
				--[[table: 0x8650568]],
				tag = "recordtypedef"
			}
			--[[table: 0x87af478]],
			modulename = {
				fields = {

				}
				--[[table: 0x86d21c8]],
				name = "modulename",
				parent = nil --[[ref]],
				sourcerange = {
					min = 1,
					max = 24
				}
				--[[table: 0x86d21f0]],
				tag = "recordtypedef"
			}
			--[[table: 0x88b5d20]]
		}
		--[[table: 0x87493b0]],
		tag = "file"
	}
	--[[table: 0x8749278]];
	_.types.typename.parent = _;
	_.types.modulename.parent = _;
	return _;
	end