	do local _ = {
		description = "",
		globalvars = {

		}
		--[[table: 0x85e2aa8]],
		shortdescription = "",
		name = "modulename",
		returns = {
			{
				types = {
					{
						typename = "modulename",
						tag = "internaltyperef"
					}
					--[[table: 0x86ab6d0]]
				}
				--[[table: 0x847dd10]],
				description = "",
				tag = "return"
			}
			--[[table: 0x8537bb0]]
		}
		--[[table: 0x84aaac8]],
		types = {
		["__=__1"] = {
				shortdescription = " Function short description\r\010 Function long description\r\010 ",
				description = "",
				name = "__=__1",
				parent = nil --[[ref]],
				returns = {

				}
				--[[table: 0x844c140]],
				params = {

				}
				--[[table: 0x8366458]],
				tag = "functiontypedef"
			}
			--[[table: 0x84bd418]],
			modulename = {
				fields = {
					functionname = {
						type = {
							typename = "__=__1",
							tag = "internaltyperef"
						}
						--[[table: 0x83f92d0]],
						description = "",
						parent = nil --[[ref]],
						shortdescription = " Function short description\r\010 Function long description\r\010 ",
						name = "functionname",
						sourcerange = {
							min = 27,
							max = 142
						}
						--[[table: 0x84b4680]],
						occurrences = {

						}
						--[[table: 0x8427df8]],
						tag = "item"
					}
					--[[table: 0x84888f0]]
				}
				--[[table: 0x8495d10]],
				name = "modulename",
				parent = nil --[[ref]],
				sourcerange = {
					min = 1,
					max = 24
				}
				--[[table: 0x83f2698]],
				tag = "recordtypedef"
			}
			--[[table: 0x8653b60]]
		}
		--[[table: 0x865b118]],
		tag = "file"
	}
	--[[table: 0x8476670]];
	_.types["__=__1"].parent = _;
	_.types.modulename.fields.functionname.parent = _.types.modulename;
	_.types.modulename.parent = _;
	return _;
	end