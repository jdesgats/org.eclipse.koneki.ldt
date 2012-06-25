do local _ = {
		unknownglobalvars = {

		}
		--[[table: 0x9090d48]],
		content = {
			localvars = {

			}
			--[[table: 0x90f1090]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0x8ff0e08]],
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
										--[[table: 0x903dc60]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x903dc38]],
									{
										sourcerange = {
											min = 27,
											max = 29
										}
										--[[table: 0x8fc4488]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x90fc5f0]]
								}
								--[[table: 0x8f9fb40]],
								sourcerange = {
									min = 5,
									max = 7
								}
								--[[table: 0x8f9fb68]],
								description = "",
								tag = "item"
							}
							--[[table: 0x8f9fb18]],
							scope = {
								min = 0,
								max = 0
							}
							--[[table: 0x8f54758]]
						}
						--[[table: 0x8f54730]]
					}
					--[[table: 0x8ef43a8]],
					sourcerange = {
						min = 1,
						max = 34
					}
					--[[table: 0x8ef43d0]],
					content = {
						nil --[[ref]],
						nil --[[ref]]
					}
					--[[table: 0x90518f0]],
					tag = "MBlock"
				}
				--[[table: 0x9051850]]
			}
			--[[table: 0x90f1068]],
			tag = "MBlock"
		}
		--[[table: 0x9090d70]],
		tag = "MInternalContent"
	}
	--[[table: 0x9057c58]];
	_.content.content[1].localvars[1].item.occurrences[1].definition = _.content.content[1].localvars[1].item;
	_.content.content[1].localvars[1].item.occurrences[2].definition = _.content.content[1].localvars[1].item;
	_.content.content[1].content[1] = _.content.content[1].localvars[1].item.occurrences[1];
	_.content.content[1].content[2] = _.content.content[1].localvars[1].item.occurrences[2];
	return _;
end