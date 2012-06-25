do local _ = {
		unknownglobalvars = {
			{
				name = "list",
				shortdescription = "",
				description = "",
				occurrences = {
					{
						sourcerange = {
							min = 12,
							max = 15
						}
						--[[table: 0x8fe2e58]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x8f6b008]]
				}
				--[[table: 0x8ee48c0]],
				sourcerange = {
					min = 12,
					max = 15
				}
				--[[table: 0x8f2c370]],
				tag = "item"
			}
			--[[table: 0x8f22c10]]
		}
		--[[table: 0x8f68590]],
		content = {
			localvars = {

			}
			--[[table: 0x90d39e0]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0x90b0028]],
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
											min = 5,
											max = 7
										}
										--[[table: 0x8f25a48]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x8f1d700]]
								}
								--[[table: 0x8fa4a20]],
								sourcerange = {
									min = 5,
									max = 7
								}
								--[[table: 0x8edf478]],
								description = "",
								tag = "item"
							}
							--[[table: 0x8fa6b28]],
							scope = {
								min = 0,
								max = 0
							}
							--[[table: 0x8f15050]]
						}
						--[[table: 0x8edf958]]
					}
					--[[table: 0x90533b8]],
					sourcerange = {
						min = 1,
						max = 25
					}
					--[[table: 0x9089770]],
					content = {
						nil --[[ref]],
						nil --[[ref]]
					}
					--[[table: 0x8fe2df0]],
					tag = "MBlock"
				}
				--[[table: 0x8f4d020]]
			}
			--[[table: 0x8f72888]],
			tag = "MBlock"
		}
		--[[table: 0x8f41700]],
		tag = "MInternalContent"
	}
	--[[table: 0x8f5c008]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.content.content[1].localvars[1].item.occurrences[1].definition = _.content.content[1].localvars[1].item;
	_.content.content[1].content[1] = _.unknownglobalvars[1].occurrences[1];
	_.content.content[1].content[2] = _.content.content[1].localvars[1].item.occurrences[1];
	return _;
end