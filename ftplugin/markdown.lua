vim.cmd("setlocal tw=80")
--[[ local cmp = require("cmp")
local sources = cmp.get_config().sources
for i = #sources, 1, -1 do
	if sources[i].name == "spell" or sources[i].name == "buffer" then
		table.remove(sources, i)
	end
end
cmp.setup.buffer({ sources = sources }) ]]
