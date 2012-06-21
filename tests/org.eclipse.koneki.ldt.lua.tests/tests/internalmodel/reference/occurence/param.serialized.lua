	do local _ = {
		unknownglobalvars = {
			{
				name = "f",
				shortdescription = "",
				description = "",
				occurrences = {
					{
						sourcerange = {
							min = 9,
							max = 9
						}
						--[[table: 0x9fd1040]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x9d2b9a0]]
				}
				--[[table: 0x9da0c80]],
				sourcerange = {
					min = 9,
					max = 9
				}
				--[[table: 0x9d10290]],
				tag = "item"
			}
			--[[table: 0xa2950d0]]
		}
		--[[table: 0xa1fdec8]],
		content = {
			localvars = {

			}
			--[[table: 0xa155b80]],
			sourcerange = {
				min = 0,
				max = 10000
			}
			--[[table: 0x9d18248]],
			content = {
				nil --[[ref]],
				{
					localvars = {
						{
							item = {
								shortdescription = "",
								name = "param",
								occurrences = {
									{
										sourcerange = {
											min = 12,
											max = 16
										}
										--[[table: 0x9c638a8]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x9df9520]],
									{
										sourcerange = {
											min = 29,
											max = 33
										}
										--[[table: 0x9b1f948]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x9aee138]]
								}
								--[[table: 0x9b5f380]],
								sourcerange = {
									min = 12,
									max = 16
								}
								--[[table: 0x9bdd088]],
								description = "",
								tag = "item"
							}
							--[[table: 0x9b5f358]],
							scope = {
								min = 0,
								max = 0
							}
							--[[table: 0xa2950a8]]
						}
						--[[table: 0x9bdd0f0]]
					}
					--[[table: 0xa1ceee0]],
					sourcerange = {
						min = 11,
						max = 39
					}
					--[[table: 0xa075710]],
					content = {
						nil --[[ref]],
						nil --[[ref]]
					}
					--[[table: 0x9a29230]],
					tag = "MBlock"
				}
				--[[table: 0xa090cc0]]
			}
			--[[table: 0x9b1c8c8]],
			tag = "MBlock"
		}
		--[[table: 0xa155b58]],
		tag = "MInternalContent"
	}
	--[[table: 0xa1fde30]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.content.content[1] = _.unknownglobalvars[1].occurrences[1];
	_.content.content[2].localvars[1].item.occurrences[1].definition = _.content.content[2].localvars[1].item;
	_.content.content[2].localvars[1].item.occurrences[2].definition = _.content.content[2].localvars[1].item;
	_.content.content[2].content[1] = _.content.content[2].localvars[1].item.occurrences[1];
	_.content.content[2].content[2] = _.content.content[2].localvars[1].item.occurrences[2];
	return _;
	end