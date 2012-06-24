	do local _ = {
		description = "",
		globalvars = {

		}
		--[[table: 0x88533e8]],
		shortdescription = "",
		name = "modulename",
		returns = {
			{
				types = {
					{
						typename = "modulename",
						tag = "internaltyperef"
					}
					--[[table: 0x8bbeac0]]
				}
				--[[table: 0x84de830]],
				description = "",
				tag = "return"
			}
			--[[table: 0x847d768]]
		}
		--[[table: 0x8bbeae8]],
		types = {
			typename = {
				fields = {

				}
				--[[table: 0x8a40bb8]],
				name = "typename",
				parent = nil --[[ref]],
				sourcerange = {

				}
				--[[table: 0x8a40be0]],
				tag = "recordtypedef"
			}
			--[[table: 0x872afc0]],
			modulename = {
				fields = {
					fieldname = {
						type = {
							typename = "typename",
							tag = "internaltyperef"
						}
						--[[table: 0x843f080]],
						description = "",
						parent = nil --[[ref]],
						shortdescription = "",
						name = "fieldname",
						sourcerange = {
							min = 27,
							max = 80
						}
						--[[table: 0x843f058]],
						occurrences = {

						}
						--[[table: 0x843f030]],
						tag = "item"
					}
					--[[table: 0x872af20]]
				}
				--[[table: 0x8886a88]],
				name = "modulename",
				parent = nil --[[ref]],
				sourcerange = {
					min = 1,
					max = 24
				}
				--[[table: 0x8886ab0]],
				tag = "recordtypedef"
			}
			--[[table: 0x8b3a708]]
		}
		--[[table: 0x88533c0]],
		tag = "file"
	}
	--[[table: 0x8bbea98]];
	_.types.typename.parent = _;
	_.types.modulename.fields.fieldname.parent = _.types.modulename;
	_.types.modulename.parent = _;
	return _;
	end