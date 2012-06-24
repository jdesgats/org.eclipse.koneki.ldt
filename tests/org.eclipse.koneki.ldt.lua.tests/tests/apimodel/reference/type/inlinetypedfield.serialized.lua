	do local _ = {
		description = "",
		globalvars = {

		}
		--[[table: 0x840d6f8]],
		shortdescription = "",
		name = "modulename",
		returns = {
			{
				types = {
					{
						typename = "modulename",
						tag = "internaltyperef"
					}
					--[[table: 0x87d0b70]]
				}
				--[[table: 0x8715528]],
				description = "",
				tag = "return"
			}
			--[[table: 0x87a4a98]]
		}
		--[[table: 0x8725d90]],
		types = {
			typename = {
				description = "",
				fields = {
					fieldname = {
						type = {
							typename = "string",
							tag = "primitivetyperef"
						}
						--[[table: 0x8580320]],
						description = "",
						parent = nil --[[ref]],
						shortdescription = "",
						name = "fieldname",
						sourcerange = {
							min = 27,
							max = 134
						}
						--[[table: 0x8733828]],
						occurrences = {

						}
						--[[table: 0x8733800]],
						tag = "item"
					}
					--[[table: 0x87337d8]]
				}
				--[[table: 0x85ea010]],
				name = "typename",
				shortdescription = " Type short description\r\010 Type long description \r\010 ",
				parent = nil --[[ref]],
				sourcerange = {
					min = 27,
					max = 134
				}
				--[[table: 0x87337b0]],
				tag = "recordtypedef"
			}
			--[[table: 0x89b7f98]],
			modulename = {
				fields = {

				}
				--[[table: 0x88482d8]],
				name = "modulename",
				parent = nil --[[ref]],
				sourcerange = {
					min = 1,
					max = 24
				}
				--[[table: 0x878fd00]],
				tag = "recordtypedef"
			}
			--[[table: 0x8516e80]]
		}
		--[[table: 0x860a7b0]],
		tag = "file"
	}
	--[[table: 0x8882878]];
	_.types.typename.fields.fieldname.parent = _.types.typename;
	_.types.typename.parent = _;
	_.types.modulename.parent = _;
	return _;
	end