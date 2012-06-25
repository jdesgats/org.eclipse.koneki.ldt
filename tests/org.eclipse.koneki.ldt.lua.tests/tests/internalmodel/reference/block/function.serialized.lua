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
						--[[table: 0x8fd22a0]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x8fd2238]]
				}
				--[[table: 0x8ff8658]],
				sourcerange = {
					min = 10,
					max = 10
				}
				--[[table: 0x8ff8680]],
				tag = "item"
			}
			--[[table: 0x8ff8548]]
		}
		--[[table: 0x90e7e98]],
		content = {
			localvars = {

			}
			--[[table: 0x9033690]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0x90336b8]],
			content = {
				nil --[[ref]],
				{
					localvars = {

					}
					--[[table: 0x9014e70]],
					sourcerange = {
						min = 11,
						max = 19
					}
					--[[table: 0x9014e98]],
					content = {

					}
					--[[table: 0x9014e48]],
					tag = "MBlock"
				}
				--[[table: 0x9014da8]]
			}
			--[[table: 0x9033668]],
			tag = "MBlock"
		}
		--[[table: 0x8ffa0f8]],
		tag = "MInternalContent"
	}
	--[[table: 0x8f406d0]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.content.content[1] = _.unknownglobalvars[1].occurrences[1];
	return _;
end