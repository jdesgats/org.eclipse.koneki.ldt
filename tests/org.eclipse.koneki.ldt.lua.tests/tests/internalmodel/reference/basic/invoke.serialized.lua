do local _ = {
		unknownglobalvars = {
			{
				name = "file",
				shortdescription = "",
				description = "",
				occurrences = {
					{
						sourcerange = {
							min = 11,
							max = 14
						}
						--[[table: 0x8f8a9b0]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x8f8a948]]
				}
				--[[table: 0x90ccfa0]],
				sourcerange = {
					min = 11,
					max = 14
				}
				--[[table: 0x90ccfc8]],
				tag = "item"
			}
			--[[table: 0x90985a0]]
		}
		--[[table: 0x900e550]],
		content = {
			localvars = {
				{
					item = {
						type = {
							expression = {
								record = nil --[[ref]],
								sourcerange = {
									min = 11,
									max = 21
								}
								--[[table: 0x9061378]],
								tag = "MInvoke",
								functionname = "read"
							}
							--[[table: 0x90b19d0]],
							returnposition = 1,
							tag = "exprtyperef"
						}
						--[[table: 0x8f8a770]],
						shortdescription = "",
						name = "f",
						occurrences = {
							{
								sourcerange = {
									min = 7,
									max = 7
								}
								--[[table: 0x8fe5ac0]],
								definition = nil --[[ref]],
								tag = "MIdentifier"
							}
							--[[table: 0x9005668]]
						}
						--[[table: 0x9016578]],
						sourcerange = {
							min = 7,
							max = 7
						}
						--[[table: 0x90165a0]],
						description = "",
						tag = "item"
					}
					--[[table: 0x9016550]],
					scope = {
						min = 0,
						max = 0
					}
					--[[table: 0x9098578]]
				}
				--[[table: 0x8f8a810]]
			}
			--[[table: 0x8f42398]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0x8f423c0]],
			content = {
				nil --[[ref]],
				nil --[[ref]]
			}
			--[[table: 0x8fd75b8]],
			tag = "MBlock"
		}
		--[[table: 0x904eb20]],
		tag = "MInternalContent"
	}
	--[[table: 0x904eaf8]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.content.localvars[1].item.type.expression.record = _.unknownglobalvars[1].occurrences[1];
	_.content.localvars[1].item.occurrences[1].definition = _.content.localvars[1].item;
	_.content.content[1] = _.content.localvars[1].item.type.expression;
	_.content.content[2] = _.content.localvars[1].item.occurrences[1];
	return _;
end