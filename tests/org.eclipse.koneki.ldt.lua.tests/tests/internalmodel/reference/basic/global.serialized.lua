do local _ = {
		unknownglobalvars = {
			{
				name = "d",
				shortdescription = "",
				description = "",
				occurrences = {
					{
						sourcerange = {
							min = 1,
							max = 1
						}
						--[[table: 0x8f40090]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x90393e0]]
				}
				--[[table: 0x8ef8d68]],
				sourcerange = {
					min = 1,
					max = 1
				}
				--[[table: 0x8ef8d90]],
				tag = "item"
			}
			--[[table: 0x8ef8d40]]
		}
		--[[table: 0x8f09238]],
		content = {
			localvars = {

			}
			--[[table: 0x906f2d0]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0x906f2f8]],
			content = {
				nil --[[ref]]
			}
			--[[table: 0x906f2a8]],
			tag = "MBlock"
		}
		--[[table: 0x8f09260]],
		tag = "MInternalContent"
	}
	--[[table: 0x8f09198]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.content.content[1] = _.unknownglobalvars[1].occurrences[1];
	return _;
end