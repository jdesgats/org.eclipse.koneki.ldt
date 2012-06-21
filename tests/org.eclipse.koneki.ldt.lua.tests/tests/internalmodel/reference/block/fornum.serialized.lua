	do local _ = {
		unknownglobalvars = {

		}
		--[[table: 0x9c22b30]],
		content = {
			localvars = {

			}
			--[[table: 0x9c1aee8]],
			sourcerange = {
				min = 0,
				max = 10000
			}
			--[[table: 0x9c1af88]],
			content = {
				{
					localvars = {
						{
							item = {
								shortdescription = "",
								name = "var",
								occurrences = {
									{
										sourcerange = {
											min = 4,
											max = 6
										}
										--[[table: 0x9e6f4d0]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x9cee338]]
								}
								--[[table: 0x9d1bf60]],
								sourcerange = {
									min = 4,
									max = 6
								}
								--[[table: 0x9e79a28]],
								description = "",
								tag = "item"
							}
							--[[table: 0x9ec9e40]],
							scope = {
								min = 0,
								max = 0
							}
							--[[table: 0x9e4b680]]
						}
						--[[table: 0x9e79ac0]]
					}
					--[[table: 0x9eac198]],
					sourcerange = {
						min = 0,
						max = 22
					}
					--[[table: 0x9de6d40]],
					content = {
						nil --[[ref]]
					}
					--[[table: 0x9d45280]],
					tag = "MBlock"
				}
				--[[table: 0x9d45208]]
			}
			--[[table: 0x9c827b8]],
			tag = "MBlock"
		}
		--[[table: 0x9c82728]],
		tag = "MInternalContent"
	}
	--[[table: 0x9ad3338]];
	_.content.content[1].localvars[1].item.occurrences[1].definition = _.content.content[1].localvars[1].item;
	_.content.content[1].content[1] = _.content.content[1].localvars[1].item.occurrences[1];
	return _;
	end