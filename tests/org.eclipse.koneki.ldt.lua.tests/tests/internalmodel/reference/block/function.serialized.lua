	do local _ = {
		unknownglobalvars = {
			{
				name = "f",
				shortdescription = "",
				description = "",
				occurrences = {
					{
						sourcerange = {
							min = 9,
							max = 9
						}
						--[[table: 0x9df8a90]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x9e1bcf8]]
				}
				--[[table: 0x9bdc3b0]],
				sourcerange = {
					min = 9,
					max = 9
				}
				--[[table: 0x9fe7570]],
				tag = "item"
			}
			--[[table: 0x9b7cc58]]
		}
		--[[table: 0x9c7db00]],
		content = {
			localvars = {

			}
			--[[table: 0x9ddc760]],
			sourcerange = {
				min = 0,
				max = 10000
			}
			--[[table: 0x9e95d30]],
			content = {
				nil --[[ref]],
				{
					localvars = {

					}
					--[[table: 0x9a495e0]],
					sourcerange = {
						min = 10,
						max = 19
					}
					--[[table: 0x9d04370]],
					content = {

					}
					--[[table: 0x9a21a70]],
					tag = "MBlock"
				}
				--[[table: 0x9b07640]]
			}
			--[[table: 0x9c37638]],
			tag = "MBlock"
		}
		--[[table: 0x9e0c1f8]],
		tag = "MInternalContent"
	}
	--[[table: 0x9d12198]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.content.content[1] = _.unknownglobalvars[1].occurrences[1];
	return _;
	end