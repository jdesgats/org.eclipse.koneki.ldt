do local _ = {
		unknownglobalvars = {
			{
				name = "f",
				shortdescription = "",
				description = "",
				occurrences = {
					{
						sourcerange = {
							min = 10,
							max = 10
						}
						--[[table: 0x901e630]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x901e5c8]]
				}
				--[[table: 0x8f8b5a0]],
				sourcerange = {
					min = 10,
					max = 10
				}
				--[[table: 0x8f8b5c8]],
				tag = "item"
			}
			--[[table: 0x8f8b490]],
			{
				name = "d",
				shortdescription = "",
				description = "",
				occurrences = {
					{
						sourcerange = {
							min = 30,
							max = 30
						}
						--[[table: 0x901e630]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x901e5c8]]
				}
				--[[table: 0x8f8b5a0]],
				sourcerange = {
					min = 30,
					max = 30
				}
				--[[table: 0x8f8b5c8]],
				tag = "item"
			}
		}
		--[[table: 0x90b32e8]],
		content = {
			localvars = {

			}
			--[[table: 0x90b33d8]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0x90b3400]],
			content = {
				nil --[[ref]],
				{
					localvars = {
						{
							item = {
								shortdescription = "",
								name = "d",
								occurrences = {
									{
										sourcerange = {
											min = 21,
											max = 21
										}
										--[[table: 0x8f7a918]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x8f7a8b0]],
									{
										sourcerange = {
											min = 27,
											max = 27
										}
										--[[table: 0x8f59f38]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x8f59f10]]
								}
								--[[table: 0x8f44538]],
								sourcerange = {
									min = 21,
									max = 21
								}
								--[[table: 0x8f44560]],
								description = "",
								tag = "item"
							}
							--[[table: 0x8f44428]],
							scope = {
								min = 0,
								max = 0
							}
							--[[table: 0x8f8b468]]
						}
						--[[table: 0x8f8b440]]
					}
					--[[table: 0x90c19d8]],
					sourcerange = {
						min = 11,
						max = 25
					}
					--[[table: 0x90c1a00]],
					content = {
						nil --[[ref]]
					}
					--[[table: 0x90c19b0]],
					tag = "MBlock"
				}
				--[[table: 0x90c1910]],
				nil --[[ref]]
			}
			--[[table: 0x90b33b0]],
			tag = "MBlock"
		}
		--[[table: 0x90b3310]],
		tag = "MInternalContent"
	}
	--[[table: 0x90c28f0]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.content.content[1] = _.unknownglobalvars[1].occurrences[1];
	_.content.content[2].localvars[1].item.occurrences[1].definition = _.content.content[2].localvars[1].item;
	_.content.content[2].localvars[1].item.occurrences[2].definition = _.content.content[2].localvars[1].item;
	_.content.content[2].content[1] = _.content.content[2].localvars[1].item.occurrences[1];
	_.content.content[3] = _.content.content[2].localvars[1].item.occurrences[2];
	return _;
end