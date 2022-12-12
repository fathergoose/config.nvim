vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

local width = vim.api.nvim_get_option("columns")
local height = vim.api.nvim_get_option("lines")

local win_height = math.ceil(height * 0.5 - 4)
local win_width = math.ceil(width * 0.3)

local row = math.ceil((height - win_height) / 2 - 1)
local col = math.ceil((width - win_width) / 2)

require("nvim-tree").setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	view = {
		-- adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
		float = {
			enable = true,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = win_width,
				height = win_height,
				row = row,
				col = col,
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	trash = {
		cmd = "trash",
	},
})
