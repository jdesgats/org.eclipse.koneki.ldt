do local _ = {
		unknownglobalvars = {
			{
				name = "lists",
				shortdescription = "",
				description = "",
				occurrences = {
					{
						sourcerange = {
							min = 12,
							max = 16
						}
						--[[table: 0xa0b30e0]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0xa0b30b8]]
				}
				--[[table: 0xa0b42e0]],
				sourcerange = {
					min = 12,
					max = 16
				}
				--[[table: 0xa0b4308]],
				tag = "item"
			}
			--[[table: 0xa0b41d0]]
		}
		--[[table: 0xa0b25e8]],
		content = {
			localvars = {

			}
			--[[table: 0xa0b26d8]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0xa0b2700]],
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
										--[[table: 0xa0b34d8]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0xa0b3470]]
								}
								--[[table: 0xa0b4038]],
								sourcerange = {
									min = 5,
									max = 7
								}
								--[[table: 0xa0b4060]],
								description = "",
								tag = "item"
							}
							--[[table: 0xa0b3f28]],
							scope = {
								min = 0,
								max = 0
							}
							--[[table: 0xa0b4168]]
						}
						--[[table: 0xa0b4140]]
					}
					--[[table: 0xa0b2d18]],
					sourcerange = {
						min = 1,
						max = 26
					}
					--[[table: 0xa0b2d40]],
					content = {
						nil --[[ref]],
						nil --[[ref]]
					}
					--[[table: 0xa0b2cf0]],
					tag = "MBlock"
				}
				--[[table: 0xa0b2c50]]
			}
			--[[table: 0xa0b26b0]],
			tag = "MBlock"
		}
		--[[table: 0xa0b2610]],
		tag = "MInternalContent"
	}
	--[[table: 0xa0b2548]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.content.content[1].localvars[1].item.occurrences[1].definition = _.content.content[1].localvars[1].item;
	_.content.content[1].content[1] = _.unknownglobalvars[1].occurrences[1];
	_.content.content[1].content[2] = _.content.content[1].localvars[1].item.occurrences[1];
	return _;
end