	do local _ = {
		description = "",
		globalvars = {

		}
		--[[table: 0x87178d8]],
		shortdescription = "",
		name = "modulename",
		returns = {
			{
				types = {
					{
						typename = "modulename",
						tag = "internaltyperef"
					}
					--[[table: 0x891b470]]
				}
				--[[table: 0x898bbc0]],
				description = "",
				tag = "return"
			}
			--[[table: 0x873e150]]
		}
		--[[table: 0x8717938]],
		types = {
			typename = {
				description = "",
				fields = {
					fieldname = {
						type = {
							typename = "string",
							tag = "primitivetyperef"
						}
						--[[table: 0x861f530]],
						description = "",
						parent = nil --[[ref]],
						shortdescription = "field short description",
						name = "fieldname",
						sourcerange = {
							min = 27,
							max = 157
						}
						--[[table: 0x87ad928]],
						occurrences = {

						}
						--[[table: 0x8634f78]],
						tag = "item"
					}
					--[[table: 0x8847050]]
				}
				--[[table: 0x8b2b540]],
				name = "typename",
				shortdescription = " Type short description\r\010 Type long description\r\010 ",
				parent = nil --[[ref]],
				sourcerange = {
					min = 27,
					max = 157
				}
				--[[table: 0x856c5d0]],
				tag = "recordtypedef"
			}
			--[[table: 0x8b28d90]],
			modulename = {
				fields = {

				}
				--[[table: 0x8851760]],
				name = "modulename",
				parent = nil --[[ref]],
				sourcerange = {
					min = 1,
					max = 24
				}
				--[[table: 0x865c120]],
				tag = "recordtypedef"
			}
			--[[table: 0x8754198]]
		}
		--[[table: 0x87969b8]],
		tag = "file"
	}
	--[[table: 0x86afb88]];
	_.types.typename.fields.fieldname.parent = _.types.typename;
	_.types.typename.parent = _;
	_.types.modulename.parent = _;
	return _;
	end