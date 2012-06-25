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
						--[[table: 0x8faa8f8]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x8fedf38]]
				}
				--[[table: 0x8fb88d0]],
				sourcerange = {
					min = 10,
					max = 10
				}
				--[[table: 0x8fb88f8]],
				tag = "item"
			}
			--[[table: 0x8fb87c0]]
		}
		--[[table: 0x90be4a0]],
		content = {
			localvars = {

			}
			--[[table: 0x90be590]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0x90be5b8]],
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
											min = 13,
											max = 17
										}
										--[[table: 0x8fd6830]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x8fce280]],
									{
										sourcerange = {
											min = 30,
											max = 34
										}
										--[[table: 0x8f507e8]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x8f507c0]]
								}
								--[[table: 0x8f8ebd8]],
								sourcerange = {
									min = 13,
									max = 17
								}
								--[[table: 0x8f8ec00]],
								description = "",
								tag = "item"
							}
							--[[table: 0x8f8eac8]],
							scope = {
								min = 0,
								max = 0
							}
							--[[table: 0x8fb8798]]
						}
						--[[table: 0x8f8ed78]]
					}
					--[[table: 0x8f55330]],
					sourcerange = {
						min = 12,
						max = 39
					}
					--[[table: 0x8f55358]],
					content = {
						nil --[[ref]],
						nil --[[ref]]
					}
					--[[table: 0x8f55308]],
					tag = "MBlock"
				}
				--[[table: 0x8f55268]]
			}
			--[[table: 0x90be568]],
			tag = "MBlock"
		}
		--[[table: 0x90be4c8]],
		tag = "MInternalContent"
	}
	--[[table: 0x902a598]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.content.content[1] = _.unknownglobalvars[1].occurrences[1];
	_.content.content[2].localvars[1].item.occurrences[1].definition = _.content.content[2].localvars[1].item;
	_.content.content[2].localvars[1].item.occurrences[2].definition = _.content.content[2].localvars[1].item;
	_.content.content[2].content[1] = _.content.content[2].localvars[1].item.occurrences[1];
	_.content.content[2].content[2] = _.content.content[2].localvars[1].item.occurrences[2];
	return _;
end