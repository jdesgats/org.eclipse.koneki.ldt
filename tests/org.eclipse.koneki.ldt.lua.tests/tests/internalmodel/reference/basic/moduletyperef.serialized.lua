do local _ = {
		unknownglobalvars = {
			{
				name = "require",
				shortdescription = "",
				description = "",
				occurrences = {
					{
						sourcerange = {
							min = 11,
							max = 17
						}
						--[[table: 0x8fe92d8]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x8fe92b0]]
				}
				--[[table: 0x8f39ae8]],
				sourcerange = {
					min = 11,
					max = 17
				}
				--[[table: 0x90ca2e8]],
				tag = "item"
			}
			--[[table: 0x8f7fe48]]
		}
		--[[table: 0x8f9b1c8]],
		content = {
			localvars = {
				{
					item = {
						type = {
							modulename = "module",
							returnposition = 1,
							tag = "moduletyperef"
						}
						--[[table: 0x8fcddc8]],
						shortdescription = "",
						name = "l",
						occurrences = {
							{
								sourcerange = {
									min = 7,
									max = 7
								}
								--[[table: 0x907dff8]],
								definition = nil --[[ref]],
								tag = "MIdentifier"
							}
							--[[table: 0x9088fd8]]
						}
						--[[table: 0x8fd9290]],
						sourcerange = {
							min = 7,
							max = 7
						}
						--[[table: 0x8fd5238]],
						description = "",
						tag = "item"
					}
					--[[table: 0x8fd9268]],
					scope = {
						min = 0,
						max = 0
					}
					--[[table: 0x8fcde18]]
				}
				--[[table: 0x8fcddf0]]
			}
			--[[table: 0x8ed6030]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0x8ed6058]],
			content = {
				{
					sourcerange = {
						min = 11,
						max = 26
					}
					--[[table: 0x8f5f900]],
					func = nil --[[ref]],
					tag = "MCall"
				}
				--[[table: 0x8f216f0]],
				nil --[[ref]]
			}
			--[[table: 0x8ed6008]],
			tag = "MBlock"
		}
		--[[table: 0x8ff8680]],
		tag = "MInternalContent"
	}
	--[[table: 0x9069570]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.content.localvars[1].item.occurrences[1].definition = _.content.localvars[1].item;
	_.content.content[1].func = _.unknownglobalvars[1].occurrences[1];
	_.content.content[2] = _.content.localvars[1].item.occurrences[1];
	return _;
end