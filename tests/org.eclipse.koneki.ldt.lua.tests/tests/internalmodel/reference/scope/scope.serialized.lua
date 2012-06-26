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
						--[[table: 0x8432d68]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x8432d00]]
				}
				--[[table: 0x85233b8]],
				sourcerange = {
					min = 10,
					max = 10
				}
				--[[table: 0x85233e0]],
				tag = "item"
			}
			--[[table: 0x85232a8]],
			{
				name = "d",
				shortdescription = "",
				description = "",
				occurrences = {
					{
						sourcerange = {
							min = 10,
							max = 10
						}
						--[[table: 0x8432d68]],
						definition = nil --[[ref]],
						tag = "MIdentifier"
					}
					--[[table: 0x8432d00]]
				}
				--[[table: 0x85233b8]],
				sourcerange = {
					min = 27,
					max = 27
				}
				--[[table: 0x85233e0]],
				tag = "item"
			}
		}
		--[[table: 0x84dba18]],
		content = {
			localvars = {

			}
			--[[table: 0x848ff60]],
			sourcerange = {
				min = 1,
				max = 10000
			}
			--[[table: 0x848ff88]],
			content = {
				nil --[[ref]],
				{
					localvars = {
						{
							item = {
								shortdescription = "",
								name = "d",
								occurrences = {
									{
										sourcerange = {
											min = 21,
											max = 21
										}
										--[[table: 0x84f8ff8]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x84f8f90]],
									{
										sourcerange = {
											min = 27,
											max = 27
										}
										--[[table: 0x8475018]],
										definition = nil --[[ref]],
										tag = "MIdentifier"
									}
									--[[table: 0x8474ff0]]
								}
								--[[table: 0x8550820]],
								sourcerange = {
									min = 21,
									max = 21
								}
								--[[table: 0x8550848]],
								description = "",
								tag = "item"
							}
							--[[table: 0x8550710]],
							scope = {
								min = 0,
								max = 0
							}
							--[[table: 0x8523280]]
						}
						--[[table: 0x85508b0]]
					}
					--[[table: 0x84484a8]],
					sourcerange = {
						min = 11,
						max = 25
					}
					--[[table: 0x84484d0]],
					content = {
						nil --[[ref]]
					}
					--[[table: 0x8448480]],
					tag = "MBlock"
				}
				--[[table: 0x84483e0]],
				nil --[[ref]]
			}
			--[[table: 0x84dbae0]],
			tag = "MBlock"
		}
		--[[table: 0x84dba40]],
		tag = "MInternalContent"
	}
	--[[table: 0x84db978]];
	_.unknownglobalvars[1].occurrences[1].definition = _.unknownglobalvars[1];
	_.content.content[1] = _.unknownglobalvars[1].occurrences[1];
	_.content.content[2].localvars[1].item.occurrences[1].definition = _.content.content[2].localvars[1].item;
	_.content.content[2].localvars[1].item.occurrences[2].definition = _.content.content[2].localvars[1].item;
	_.content.content[2].content[1] = _.content.content[2].localvars[1].item.occurrences[1];
	_.content.content[3] = _.content.content[2].localvars[1].item.occurrences[2];
	return _;
end
