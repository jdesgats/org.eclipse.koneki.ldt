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
						--[[table: 0x8fdcbc8]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x8fdcb50]]
				}
				--[[table: 0x9020fe8]],
				sourcerange = {
					min = 12,
					max = 15
				}
				--[[table: 0x9021010]],
				tag = "item"
			}
			--[[table: 0x8f9dc80]]
		}
		--[[table: 0x901b1d0]],
		content = {
			localvars = {

			}
			--[[table: 0x901b2c0]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0x901b2e8]],
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
										--[[table: 0x9087788]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x9087710]],
									{
										sourcerange = {
											min = 30,
											max = 32
										}
										--[[table: 0x90a03d8]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x90a03b0]]
								}
								--[[table: 0x8f9da80]],
								sourcerange = {
									min = 5,
									max = 7
								}
								--[[table: 0x8f9daa8]],
								description = "",
								tag = "item"
							}
							--[[table: 0x8f9d970]],
							scope = {
								min = 0,
								max = 0
							}
							--[[table: 0x8f9dc58]]
						}
						--[[table: 0x8f9dc30]]
					}
					--[[table: 0x902cfb8]],
					sourcerange = {
						min = 1,
						max = 37
					}
					--[[table: 0x902cfe0]],
					content = {
						nil --[[ref]],
						nil --[[ref]],
						nil --[[ref]]
					}
					--[[table: 0x902cf90]],
					tag = "MBlock"
				}
				--[[table: 0x902cef0]]
			}
			--[[table: 0x901b298]],
			tag = "MBlock"
		}
		--[[table: 0x901b1f8]],
		tag = "MInternalContent"
	}
	--[[table: 0x901b130]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.content.content[1].localvars[1].item.occurrences[1].definition = _.content.content[1].localvars[1].item;
	_.content.content[1].localvars[1].item.occurrences[2].definition = _.content.content[1].localvars[1].item;
	_.content.content[1].content[1] = _.unknownglobalvars[1].occurrences[1];
	_.content.content[1].content[2] = _.content.content[1].localvars[1].item.occurrences[1];
	_.content.content[1].content[3] = _.content.content[1].localvars[1].item.occurrences[2];
	return _;
end