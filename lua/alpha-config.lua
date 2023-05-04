local alpha = require("alpha")
local startify = require("alpha.themes.startify")

local function get_current_basename()
    local cwd = vim.fn.getcwd():match("([^/]+)$")
    if not cwd then
      cwd = ""
    end
    return cwd
end

startify.nvim_web_devicons.enabled = true
startify.section.top_buttons.val = {
	startify.button("z", "󰯓  New Zettel", [[<cmd>ObsidianNew<cr>]]),
	startify.button("e", "󰌴  New file", ":ene <BAR> startinsert <CR>"),
	startify.button("r", "󰦛  Restore last session", [[<cmd>lua require("persistence").load({ last = true })<cr>]]),
	startify.button(
		"d",
		"󰝉  Restore last session for CWD " .. get_current_basename(),
		[[<cmd>lua require("persistence").load()<cr>]]
	),
	startify.button("f", "󱝩  Find file", [[<cmd>Telescope frecency<cr>]]),
	startify.button("n", "󱙓  Find note", [[<cmd>ObsidianQuickSwitch<cr>]]),
    startify.button("p", "󱘢  Find project", [[<cmd>Telescope projects<cr>]]),
    startify.button("t", "󰃶  Today's daily note", [[<cmd>ObsidianToday<cr>]]),
    }
startify.config.opts.margin = 20
startify.config.opts.autostart = true
alpha.setup(startify.config)

