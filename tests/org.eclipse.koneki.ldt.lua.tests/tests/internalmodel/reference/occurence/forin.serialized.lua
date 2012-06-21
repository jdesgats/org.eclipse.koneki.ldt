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
						--[[table: 0xa0b0178]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0xa0b0110]]
				}
				--[[table: 0xa0b1e68]],
				sourcerange = {
					min = 11,
					max = 14
				}
				--[[table: 0xa0b1e90]],
				tag = "item"
			}
			--[[table: 0xa0b1d58]]
		}
		--[[table: 0xa0af6f8]],
		content = {
			localvars = {

			}
			--[[table: 0xa0af7e8]],
			sourcerange = {
				min = 0,
				max = 10000
			}
			--[[table: 0xa0af810]],
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
										--[[table: 0xa0b0570]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0xa0b0508]],
									{
										sourcerange = {
											min = 29,
											max = 31
										}
										--[[table: 0xa0b0a90]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0xa0b0a68]]
								}
								--[[table: 0xa0b1b68]],
								sourcerange = {
									min = 4,
									max = 6
								}
								--[[table: 0xa0b1b90]],
								description = "",
								tag = "item"
							}
							--[[table: 0xa0b1a58]],
							scope = {
								min = 0,
								max = 0
							}
							--[[table: 0xa0b1d30]]
						}
						--[[table: 0xa0b1d08]]
					}
					--[[table: 0xa0afdc8]],
					sourcerange = {
						min = 0,
						max = 37
					}
					--[[table: 0xa0afdf0]],
					content = {
						nil --[[ref]],
						nil --[[ref]],
						nil --[[ref]]
					}
					--[[table: 0xa0afda0]],
					tag = "MBlock"
				}
				--[[table: 0xa0afd00]]
			}
			--[[table: 0xa0af7c0]],
			tag = "MBlock"
		}
		--[[table: 0xa0af720]],
		tag = "MInternalContent"
	}
	--[[table: 0xa0af658]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.content.content[1].localvars[1].item.occurrences[1].definition = _.content.content[1].localvars[1].item;
	_.content.content[1].localvars[1].item.occurrences[2].definition = _.content.content[1].localvars[1].item;
	_.content.content[1].content[1] = _.unknownglobalvars[1].occurrences[1];
	_.content.content[1].content[2] = _.content.content[1].localvars[1].item.occurrences[1];
	_.content.content[1].content[3] = _.content.content[1].localvars[1].item.occurrences[2];
	return _;
	end