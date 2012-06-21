	do local _ = {
		unknownglobalvars = {

		}
		--[[table: 0x9e1dd48]],
		content = {
			localvars = {
				{
					item = {
						shortdescription = "",
						name = "d",
						occurrences = {
							{
								sourcerange = {
									min = 6,
									max = 6
								}
								--[[table: 0xa0acc78]],
								definition = nil --[[ref]],
								tag = "MIdentifier"
							}
							--[[table: 0x9b32fd0]],
							{
								sourcerange = {
									min = 8,
									max = 8
								}
								--[[table: 0x9d110c8]],
								definition = nil --[[ref]],
								tag = "MIdentifier"
							}
							--[[table: 0x9c63d80]]
						}
						--[[table: 0x9e36c20]],
						sourcerange = {
							min = 6,
							max = 6
						}
						--[[table: 0xa07f558]],
						description = "",
						tag = "item"
					}
					--[[table: 0x9e369e8]],
					scope = {
						min = 0,
						max = 0
					}
					--[[table: 0xa2c2a40]]
				}
				--[[table: 0xa1e64b8]]
			}
			--[[table: 0xa1be348]],
			sourcerange = {
				min = 0,
				max = 10000
			}
			--[[table: 0x9d78a28]],
			content = {
				nil --[[ref]],
				nil --[[ref]]
			}
			--[[table: 0x9c97800]],
			tag = "MBlock"
		}
		--[[table: 0xa2245e8]],
		tag = "MInternalContent"
	}
	--[[table: 0x9d607f0]];
	_.content.localvars[1].item.occurrences[1].definition = _.content.localvars[1].item;
	_.content.localvars[1].item.occurrences[2].definition = _.content.localvars[1].item;
	_.content.content[1] = _.content.localvars[1].item.occurrences[1];
	_.content.content[2] = _.content.localvars[1].item.occurrences[2];
	return _;
	end