do local _ = {
		unknownglobalvars = {
			{
				name = "string",
				shortdescription = "",
				description = "",
				occurrences = {
					{
						sourcerange = {
							min = 17,
							max = 22
						}
						--[[table: 0x8fa0ce0]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x8fa0cb8]]
				}
				--[[table: 0x8ed9208]],
				sourcerange = {
					min = 17,
					max = 22
				}
				--[[table: 0x8f58cf8]],
				tag = "item"
			}
			--[[table: 0x8ee3e10]]
		}
		--[[table: 0x8f57018]],
		content = {
			localvars = {
				{
					item = {
						type = {
							expression = {
								sourcerange = {
									min = 17,
									max = 29
								}
								--[[table: 0x90cbf50]],
								right = "format",
								left = nil --[[ref]],
								tag = "MIndex"
							}
							--[[table: 0x8fb1cd8]],
							returnposition = 1,
							tag = "exprtyperef"
						}
						--[[table: 0x8fea190]],
						shortdescription = "",
						name = "sformat",
						occurrences = {
							{
								sourcerange = {
									min = 7,
									max = 13
								}
								--[[table: 0x90b5a60]],
								definition = nil --[[ref]],
								tag = "MIdentifier"
							}
							--[[table: 0x9070920]]
						}
						--[[table: 0x8f30de8]],
						sourcerange = {
							min = 7,
							max = 13
						}
						--[[table: 0x8ff15d0]],
						description = "",
						tag = "item"
					}
					--[[table: 0x906c268]],
					scope = {
						min = 0,
						max = 0
					}
					--[[table: 0x902cca0]]
				}
				--[[table: 0x900ff30]]
			}
			--[[table: 0x90de190]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0x8edd4a0]],
			content = {
				nil --[[ref]],
				nil --[[ref]]
			}
			--[[table: 0x90de128]],
			tag = "MBlock"
		}
		--[[table: 0x90af180]],
		tag = "MInternalContent"
	}
	--[[table: 0x8f47b08]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.content.localvars[1].item.type.expression.left = _.unknownglobalvars[1].occurrences[1];
	_.content.localvars[1].item.occurrences[1].definition = _.content.localvars[1].item;
	_.content.content[1] = _.content.localvars[1].item.type.expression;
	_.content.content[2] = _.content.localvars[1].item.occurrences[1];
	return _;
end