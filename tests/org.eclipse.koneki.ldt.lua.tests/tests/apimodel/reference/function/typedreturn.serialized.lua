	do local _ = {
		description = "",
		globalvars = {

		}
		--[[table: 0x849af78]],
		shortdescription = "",
		name = "modulename",
		returns = {
			{
				types = {
					{
						typename = "modulename",
						tag = "internaltyperef"
					}
					--[[table: 0x85ae480]]
				}
				--[[table: 0x87a2898]],
				description = "",
				tag = "return"
			}
			--[[table: 0x8668188]]
		}
		--[[table: 0x86a8ec8]],
		types = {
		["__#string=__1"] = {
				shortdescription = " Function short description\010 Function long description\010 ",
				description = "",
				name = "__#string=__1",
				parent = nil --[[ref]],
				returns = {
					{
						types = {
							{
								typename = "string",
								tag = "primitivetyperef"
							}
							--[[table: 0x86391c8]]
						}
						--[[table: 0x860e0d0]],
						description = "",
						tag = "return"
					}
					--[[table: 0x878cd50]]
				}
				--[[table: 0x8662970]],
				params = {

				}
				--[[table: 0x8662948]],
				tag = "functiontypedef"
			}
			--[[table: 0x86628a8]],
			modulename = {
				fields = {
					functionname = {
						type = {
							typename = "__#string=__1",
							tag = "internaltyperef"
						}
						--[[table: 0x85adef0]],
						description = "",
						parent = nil --[[ref]],
						shortdescription = " Function short description\010 Function long description\010 ",
						name = "functionname",
						sourcerange = {
							min = 25,
							max = 155
						}
						--[[table: 0x88564d8]],
						occurrences = {

						}
						--[[table: 0x8739b98]],
						tag = "item"
					}
					--[[table: 0x87b9630]]
				}
				--[[table: 0x862e410]],
				name = "modulename",
				parent = nil --[[ref]],
				sourcerange = {
					min = 1,
					max = 23
				}
				--[[table: 0x8572028]],
				tag = "recordtypedef"
			}
			--[[table: 0x877def0]]
		}
		--[[table: 0x8749848]],
		tag = "file"
	}
	--[[table: 0x85ae458]];
	_.types["__#string=__1"].parent = _;
	_.types.modulename.fields.functionname.parent = _.types.modulename;
	_.types.modulename.parent = _;
	return _;
	end