	do local _ = {
		unknownglobalvars = {
			{
				name = "d",
				shortdescription = "",
				description = "",
				occurrences = {
					{
						sourcerange = {
							min = 0,
							max = 0
						}
						--[[table: 0xa275ff8]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0xa326a28]],
					{
						sourcerange = {
							min = 8,
							max = 8
						}
						--[[table: 0xa0bc768]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0xa0bc700]]
				}
				--[[table: 0xa18d428]],
				sourcerange = {
					min = 0,
					max = 0
				}
				--[[table: 0xa18d450]],
				tag = "item"
			}
			--[[table: 0xa1c26c8]]
		}
		--[[table: 0xa3240e8]],
		content = {
			localvars = {

			}
			--[[table: 0xa323040]],
			sourcerange = {
				min = 0,
				max = 10000
			}
			--[[table: 0xa3257e0]],
			content = {
				nil --[[ref]],
				nil --[[ref]]
			}
			--[[table: 0xa323e18]],
			tag = "MBlock"
		}
		--[[table: 0xa324110]],
		tag = "MInternalContent"
	}
	--[[table: 0xa323df0]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.unknownglobalvars[1].occurrences[2].definition = _.unknownglobalvars[1];
	_.content.content[1] = _.unknownglobalvars[1].occurrences[1];
	_.content.content[2] = _.unknownglobalvars[1].occurrences[2];
	return _;
	end