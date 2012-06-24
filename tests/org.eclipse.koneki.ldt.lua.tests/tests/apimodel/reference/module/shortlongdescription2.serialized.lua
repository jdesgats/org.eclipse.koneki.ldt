	do local _ = {
		description = "",
		globalvars = {

		}
		--[[table: 0x86ea020]],
		shortdescription = " Module short description\010 Module long description\010 ",
		name = "modulename",
		returns = {
			{
				types = {
					{
						typename = "modulename",
						tag = "internaltyperef"
					}
					--[[table: 0x85b5550]]
				}
				--[[table: 0x859a600]],
				description = "",
				tag = "return"
			}
			--[[table: 0x874c3e8]]
		}
		--[[table: 0x865acc0]],
		types = {
			modulename = {
				fields = {

				}
				--[[table: 0x864d428]],
				name = "modulename",
				parent = nil --[[ref]],
				sourcerange = {
					min = 1,
					max = 81
				}
				--[[table: 0x87330f0]],
				tag = "recordtypedef"
			}
			--[[table: 0x8874220]]
		}
		--[[table: 0x87c7c90]],
		tag = "file"
	}
	--[[table: 0x87e0b28]];
	_.types.modulename.parent = _;
	return _;
	end