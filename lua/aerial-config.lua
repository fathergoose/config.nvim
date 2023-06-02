local aerial = require("aerial")
require("aerial").setup({
	min_width = 20,
	default_direction = "right",
	placement = "edge",
	attach_mode = "global",
	close_automatic_events = { "unsupported" },

	keymaps = {
		["?"] = "actions.show_help",
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.jump",
		["<2-LeftMouse>"] = "actions.jump",
		["<C-v>"] = "actions.jump_vsplit",
		["<C-s>"] = "trueactions.jump_split",
		["p"] = "actions.scroll",
		["<C-j>"] = "actions.down_and_scroll",
		["<C-k>"] = "actions.up_and_scroll",
		["{"] = "actions.prev",
		["}"] = "actions.next",
		["[["] = "actions.prev_up",
		["]]"] = "actions.next_up",
		["q"] = "actions.close",
		["o"] = "actions.tree_toggle",
		["za"] = "actions.tree_toggle",
		["O"] = "actions.tree_toggle_recursive",
		["zA"] = "actions.tree_toggle_recursive",
		["l"] = "actions.tree_open",
		["zo"] = "actions.tree_open",
		["L"] = "actions.tree_open_recursive",
		["zO"] = "actions.tree_open_recursive",
		["h"] = "actions.tree_close",
		["zc"] = "actions.tree_close",
		["H"] = "actions.tree_close_recursive",
		["zC"] = "actions.tree_close_recursive",
		["zr"] = "actions.tree_increase_fold_level",
		["zR"] = "actions.tree_open_all",
		["zm"] = "actions.tree_decrease_fold_level",
		["zM"] = "actions.tree_close_all",
		["zx"] = "actions.tree_sync_folds",
		["zX"] = "actions.tree_sync_folds",
	},
	lazy_load = true,
	filter_kind = false,
	manage_folds = true,
	link_folds_to_tree = true,
    open_automatic = false,
	--[[ open_automatic = function(bufnr)
		return vim.api.nvim_buf_line_count(bufnr) > 80 and aerial.num_symbols(bufnr) > 4 and not aerial.was_closed()
	end, ]]
})
