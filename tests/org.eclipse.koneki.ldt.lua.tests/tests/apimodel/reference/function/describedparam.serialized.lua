	do local _ = {
		description = "",
		globalvars = {

		}
		--[[table: 0x83a7d60]],
		shortdescription = "",
		name = "modulename",
		returns = {
			{
				types = {
					{
						typename = "modulename",
						tag = "internaltyperef"
					}
					--[[table: 0x83a7c28]]
				}
				--[[table: 0x83a7cf0]],
				description = "",
				tag = "return"
			}
			--[[table: 0x83a7c50]]
		}
		--[[table: 0x83a7d88]],
		types = {
		["__=[paramname]__1"] = {
				shortdescription = " Function short description\010 Function long description\010 ",
				description = "",
				name = "__=[paramname]__1",
				parent = nil --[[ref]],
				returns = {

				}
				--[[table: 0x83f7f98]],
				params = {
					{
						description = "param description",
						name = "paramname",
						tag = "parameter"
					}
					--[[table: 0x83f7ef8]]
				}
				--[[table: 0x83f7f70]],
				tag = "functiontypedef"
			}
			--[[table: 0x83f7ed0]],
			modulename = {
				fields = {
					functionname = {
						type = {
							typename = "__=[paramname]__1",
							tag = "internaltyperef"
						}
						--[[table: 0x83f81c8]],
						description = "",
						parent = nil --[[ref]],
						shortdescription = " Function short description\010 Function long description\010 ",
						name = "functionname",
						sourcerange = {
							min = 25,
							max = 174
						}
						--[[table: 0x83f7e50]],
						occurrences = {

						}
						--[[table: 0x83f7e28]],
						tag = "item"
					}
					--[[table: 0x83f7d18]]
				}
				--[[table: 0x83f23d8]],
				name = "modulename",
				parent = nil --[[ref]],
				sourcerange = {
					min = 1,
					max = 23
				}
				--[[table: 0x83f2400]],
				tag = "recordtypedef"
			}
			--[[table: 0x83f22c8]]
		}
		--[[table: 0x83a7d38]],
		tag = "file"
	}
	--[[table: 0x83a7c00]];
	_.types["__=[paramname]__1"].parent = _;
	_.types.modulename.fields.functionname.parent = _.types.modulename;
	_.types.modulename.parent = _;
	return _;
	end