do local _ = {
		unknownglobalvars = {

		}
		--[[table: 0x8b32de0]],
		content = {
			localvars = {

			}
			--[[table: 0x8b32ed0]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0x8b32ef8]],
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
										--[[table: 0x8b33800]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x8b337d8]]
								}
								--[[table: 0x8b349d8]],
								sourcerange = {
									min = 5,
									max = 7
								}
								--[[table: 0x8b34a00]],
								description = "",
								tag = "item"
							}
							--[[table: 0x8b348c8]],
							scope = {
								min = 0,
								max = 0
							}
							--[[table: 0x8b34b08]]
						}
						--[[table: 0x8b34ae0]]
					}
					--[[table: 0x8b33510]],
					sourcerange = {
						min = 1,
						max = 22
					}
					--[[table: 0x8b33538]],
					content = {
						nil --[[ref]]
					}
					--[[table: 0x8b334e8]],
					tag = "MBlock"
				}
				--[[table: 0x8b33448]]
			}
			--[[table: 0x8b32ea8]],
			tag = "MBlock"
		}
		--[[table: 0x8b32e08]],
		tag = "MInternalContent"
	}
	--[[table: 0x8b32d40]];
	_.content.content[1].localvars[1].item.occurrences[1].definition = _.content.content[1].localvars[1].item;
	_.content.content[1].content[1] = _.content.content[1].localvars[1].item.occurrences[1];
	return _;
end