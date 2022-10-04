local M = {}

M.project_files = function()
	local opts = {}
	local ok = pcall(require("telescope.builtin").git_files, opts)
	if not ok then
		require("telescope.builtin").find_files(opts)
	end
end

-- local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup({
    winblend = 10,
	defaults = {
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
        file_ignore_patterns = { ".git" },
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		},
		frecency = {
			theme = "dropdown",
		},
	},
	extensions = {
		frecency = {
			db_root = "/Users/al/.config/nvim/frecency",
			show_scores = false,
			show_unindexed = true,
			ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*", "*/layers/*" },
			disable_devicons = false,
			workspaces = {
				["conf"] = "/Users/al/.config",
				["AI"] = "/Users/al/code/Augintel",
				["wiki"] = "/Users/al/Desktop/vimwiki",
				["code"] = "/Users/al/code",
				["APIs"] = "/Users/al/code/Augintel/apis",
				["UI"] = "/Users/al/code/Augintel/augintel-ui",
			},
		},
		fzy_native = {
			override_generic_sorter = true,
			override_file_sorter = true,
		},
	},
})

telescope.load_extension("frecency")
telescope.load_extension("fzy_native")

return M
