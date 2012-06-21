	do local _ = {
		unknownglobalvars = {

		}
		--[[table: 0x9e009f0]],
		content = {
			localvars = {

			}
			--[[table: 0x9b2c318]],
			sourcerange = {
				min = 0,
				max = 10000
			}
			--[[table: 0xa056188]],
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
										--[[table: 0x9a604a0]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x9ac49a0]],
									{
										sourcerange = {
											min = 26,
											max = 28
										}
										--[[table: 0x9b07b18]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x9db4b80]]
								}
								--[[table: 0x9a452e0]],
								sourcerange = {
									min = 4,
									max = 6
								}
								--[[table: 0x9c7ad20]],
								description = "",
								tag = "item"
							}
							--[[table: 0x9a452b8]],
							scope = {
								min = 0,
								max = 0
							}
							--[[table: 0x9f0d428]]
						}
						--[[table: 0x9c7ad48]]
					}
					--[[table: 0x9a4d878]],
					sourcerange = {
						min = 0,
						max = 34
					}
					--[[table: 0x9a4d8a0]],
					content = {
						nil --[[ref]],
						nil --[[ref]]
					}
					--[[table: 0x9a4d850]],
					tag = "MBlock"
				}
				--[[table: 0x9baf3e0]]
			}
			--[[table: 0x9d75e20]],
			tag = "MBlock"
		}
		--[[table: 0x9f87a30]],
		tag = "MInternalContent"
	}
	--[[table: 0x9ff6d98]];
	_.content.content[1].localvars[1].item.occurrences[1].definition = _.content.content[1].localvars[1].item;
	_.content.content[1].localvars[1].item.occurrences[2].definition = _.content.content[1].localvars[1].item;
	_.content.content[1].content[1] = _.content.content[1].localvars[1].item.occurrences[1];
	_.content.content[1].content[2] = _.content.content[1].localvars[1].item.occurrences[2];
	return _;
	end