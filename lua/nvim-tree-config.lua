vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

local width = vim.api.nvim_get_option("columns")
local height = vim.api.nvim_get_option("lines")

local win_height = math.ceil(height * 0.5 - 4)
local win_width = math.ceil(width * 0.3)

local row = math.ceil((height - win_height) / 2 - 1)
local col = math.ceil((width - win_width) / 2 )

require("nvim-tree").setup({
    open_on_setup = true,
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
			enable = false,
			quit_on_focus_loss = true,
			open_win_config = {
                -- anchor = "NE",
				relative = "editor",
				border = "rounded",
                height = 30,
                width = 60,
				row = row,
				col = col,
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
	trash = {
		cmd = "trash",
	},
})
