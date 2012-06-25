do local _ = {
		unknownglobalvars = {
			{
				name = "call",
				shortdescription = "",
				description = "",
				occurrences = {
					{
						sourcerange = {
							min = 11,
							max = 14
						}
						--[[table: 0x8f3f738]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x8f3f710]]
				}
				--[[table: 0x8f411c8]],
				sourcerange = {
					min = 11,
					max = 14
				}
				--[[table: 0x8f411f0]],
				tag = "item"
			}
			--[[table: 0x8f410b8]]
		}
		--[[table: 0x8f3edb8]],
		content = {
			localvars = {
				{
					item = {
						type = {
							expression = {
								sourcerange = {
									min = 11,
									max = 19
								}
								--[[table: 0x8f3f880]],
								func = nil --[[ref]],
								tag = "MCall"
							}
							--[[table: 0x8f3f7e0]],
							returnposition = 1,
							tag = "exprtyperef"
						}
						--[[table: 0x8f40f10]],
						shortdescription = "",
						name = "c",
						occurrences = {
							{
								sourcerange = {
									min = 7,
									max = 7
								}
								--[[table: 0x8f40148]],
								definition = nil --[[ref]],
								tag = "MIdentifier"
							}
							--[[table: 0x8f3f6b8]]
						}
						--[[table: 0x8f40e80]],
						sourcerange = {
							min = 7,
							max = 7
						}
						--[[table: 0x8f40ea8]],
						description = "",
						tag = "item"
					}
					--[[table: 0x8f40d70]],
					scope = {
						min = 0,
						max = 0
					}
					--[[table: 0x8f41050]]
				}
				--[[table: 0x8f41028]]
			}
			--[[table: 0x8f3eea8]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0x8f3eed0]],
			content = {
				nil --[[ref]],
				nil --[[ref]]
			}
			--[[table: 0x8f3ee80]],
			tag = "MBlock"
		}
		--[[table: 0x8f3ede0]],
		tag = "MInternalContent"
	}
	--[[table: 0x8f3ed18]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.content.localvars[1].item.type.expression.func = _.unknownglobalvars[1].occurrences[1];
	_.content.localvars[1].item.occurrences[1].definition = _.content.localvars[1].item;
	_.content.content[1] = _.content.localvars[1].item.type.expression;
	_.content.content[2] = _.content.localvars[1].item.occurrences[1];
	return _;
end