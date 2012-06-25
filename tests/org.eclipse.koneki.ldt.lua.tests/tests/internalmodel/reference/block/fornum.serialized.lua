do local _ = {
		unknownglobalvars = {

		}
		--[[table: 0x90232f8]],
		content = {
			localvars = {

			}
			--[[table: 0x90233e8]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0x9023410]],
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
										--[[table: 0x90d73f8]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x90d7390]]
								}
								--[[table: 0x90ac880]],
								sourcerange = {
									min = 5,
									max = 7
								}
								--[[table: 0x90ac8a8]],
								description = "",
								tag = "item"
							}
							--[[table: 0x90ac770]],
							scope = {
								min = 0,
								max = 0
							}
							--[[table: 0x90ac9b0]]
						}
						--[[table: 0x90ac988]]
					}
					--[[table: 0x90d6bf8]],
					sourcerange = {
						min = 1,
						max = 22
					}
					--[[table: 0x90d6c20]],
					content = {
						nil --[[ref]]
					}
					--[[table: 0x90d6bd0]],
					tag = "MBlock"
				}
				--[[table: 0x90d6b30]]
			}
			--[[table: 0x90233c0]],
			tag = "MBlock"
		}
		--[[table: 0x9023320]],
		tag = "MInternalContent"
	}
	--[[table: 0x9023258]];
	_.content.content[1].localvars[1].item.occurrences[1].definition = _.content.content[1].localvars[1].item;
	_.content.content[1].content[1] = _.content.content[1].localvars[1].item.occurrences[1];
	return _;
end