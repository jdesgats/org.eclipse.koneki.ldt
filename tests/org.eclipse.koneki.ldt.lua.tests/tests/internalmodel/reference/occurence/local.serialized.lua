do local _ = {
		unknownglobalvars = {

		}
		--[[table: 0x8fd2ff8]],
		content = {
			localvars = {
				{
					item = {
						shortdescription = "",
						name = "d",
						occurrences = {
							{
								sourcerange = {
									min = 7,
									max = 7
								}
								--[[table: 0x8f7a158]],
								definition = nil --[[ref]],
								tag = "MIdentifier"
							}
							--[[table: 0x8f7a0f0]],
							{
								sourcerange = {
									min = 9,
									max = 9
								}
								--[[table: 0x8fe70e8]],
								definition = nil --[[ref]],
								tag = "MIdentifier"
							}
							--[[table: 0x9061628]]
						}
						--[[table: 0x8f886d8]],
						sourcerange = {
							min = 7,
							max = 7
						}
						--[[table: 0x8f88700]],
						description = "",
						tag = "item"
					}
					--[[table: 0x900e980]],
					scope = {
						min = 0,
						max = 0
					}
					--[[table: 0x900ea48]]
				}
				--[[table: 0x900ea20]]
			}
			--[[table: 0x8fd30e8]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0x8fd3110]],
			content = {
				nil --[[ref]],
				nil --[[ref]]
			}
			--[[table: 0x8fd30c0]],
			tag = "MBlock"
		}
		--[[table: 0x8fd3020]],
		tag = "MInternalContent"
	}
	--[[table: 0x9094510]];
	_.content.localvars[1].item.occurrences[1].definition = _.content.localvars[1].item;
	_.content.localvars[1].item.occurrences[2].definition = _.content.localvars[1].item;
	_.content.content[1] = _.content.localvars[1].item.occurrences[1];
	_.content.content[2] = _.content.localvars[1].item.occurrences[2];
	return _;
end