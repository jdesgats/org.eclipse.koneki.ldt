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
						--[[table: 0x8f62d50]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x8f62ce8]],
					{
						sourcerange = {
							min = 9,
							max = 9
						}
						--[[table: 0x9003680]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x9003618]]
				}
				--[[table: 0x9004518]],
				sourcerange = {
					min = 1,
					max = 1
				}
				--[[table: 0x9004540]],
				tag = "item"
			}
			--[[table: 0x9019770]]
		}
		--[[table: 0x8fd1648]],
		content = {
			localvars = {

			}
			--[[table: 0x8fd1738]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0x8fd1760]],
			content = {
				nil --[[ref]],
				nil --[[ref]]
			}
			--[[table: 0x8fd1710]],
			tag = "MBlock"
		}
		--[[table: 0x8fd1670]],
		tag = "MInternalContent"
	}
	--[[table: 0x8fd15a8]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.unknownglobalvars[1].occurrences[2].definition = _.unknownglobalvars[1];
	_.content.content[1] = _.unknownglobalvars[1].occurrences[1];
	_.content.content[2] = _.unknownglobalvars[1].occurrences[2];
	return _;
end