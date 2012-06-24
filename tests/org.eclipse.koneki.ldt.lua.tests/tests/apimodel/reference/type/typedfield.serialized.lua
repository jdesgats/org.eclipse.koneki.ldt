	do local _ = {
		description = "",
		globalvars = {

		}
		--[[table: 0x89e1640]],
		shortdescription = "",
		name = "modulename",
		returns = {
			{
				types = {
					{
						typename = "modulename",
						tag = "internaltyperef"
					}
					--[[table: 0x89e1508]]
				}
				--[[table: 0x89e1530]],
				description = "",
				tag = "return"
			}
			--[[table: 0x8a7cb90]]
		}
		--[[table: 0x89e1668]],
		types = {
			typename = {
				description = "",
				fields = {
					fieldname = {
						type = {
							typename = "string",
							tag = "primitivetyperef"
						}
						--[[table: 0x8b7f268]],
						description = "",
						parent = nil --[[ref]],
						shortdescription = " Field short description\r\010 Field long description\r\010 ",
						name = "fieldname",
						sourcerange = {
							min = 49,
							max = 157
						}
						--[[table: 0x8b7f200]],
						occurrences = {

						}
						--[[table: 0x8684530]],
						tag = "item"
					}
					--[[table: 0x8684508]]
				}
				--[[table: 0x8b23290]],
				name = "typename",
				shortdescription = "",
				parent = nil --[[ref]],
				sourcerange = {
					min = 27,
					max = 46
				}
				--[[table: 0x8b232b8]],
				tag = "recordtypedef"
			}
			--[[table: 0x8b23160]],
			modulename = {
				fields = {

				}
				--[[table: 0x84f5298]],
				name = "modulename",
				parent = nil --[[ref]],
				sourcerange = {
					min = 1,
					max = 24
				}
				--[[table: 0x84f52c0]],
				tag = "recordtypedef"
			}
			--[[table: 0x89e1558]]
		}
		--[[table: 0x89e1618]],
		tag = "file"
	}
	--[[table: 0x89e14e0]];
	_.types.typename.fields.fieldname.parent = _.types.typename;
	_.types.typename.parent = _;
	_.types.modulename.parent = _;
	return _;
	end