	do local _ = {
		unknownglobalvars = {
			{
				name = "list",
				shortdescription = "",
				description = "",
				occurrences = {
					{
						sourcerange = {
							min = 11,
							max = 14
						}
						--[[table: 0x9e68258]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x9b11448]]
				}
				--[[table: 0x9c6cb18]],
				sourcerange = {
					min = 11,
					max = 14
				}
				--[[table: 0x9c6cb40]],
				tag = "item"
			}
			--[[table: 0x9b5a2b0]]
		}
		--[[table: 0x9d91b70]],
		content = {
			localvars = {

			}
			--[[table: 0x9d91c60]],
			sourcerange = {
				min = 0,
				max = 10000
			}
			--[[table: 0x9d91c88]],
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
										--[[table: 0x9ee07a8]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x9ee0740]]
								}
								--[[table: 0x9b5a118]],
								sourcerange = {
									min = 4,
									max = 6
								}
								--[[table: 0x9b5a140]],
								description = "",
								tag = "item"
							}
							--[[table: 0x9b5a008]],
							scope = {
								min = 0,
								max = 0
							}
							--[[table: 0x9b5a248]]
						}
						--[[table: 0x9b5a220]]
					}
					--[[table: 0x9e67e98]],
					sourcerange = {
						min = 0,
						max = 25
					}
					--[[table: 0x9e67ec0]],
					content = {
						nil --[[ref]],
						nil --[[ref]]
					}
					--[[table: 0x9e7c608]],
					tag = "MBlock"
				}
				--[[table: 0x9da8808]]
			}
			--[[table: 0x9d91c38]],
			tag = "MBlock"
		}
		--[[table: 0x9d91b98]],
		tag = "MInternalContent"
	}
	--[[table: 0x9d91ad0]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.content.content[1].localvars[1].item.occurrences[1].definition = _.content.content[1].localvars[1].item;
	_.content.content[1].content[1] = _.unknownglobalvars[1].occurrences[1];
	_.content.content[1].content[2] = _.content.content[1].localvars[1].item.occurrences[1];
	return _;
	end