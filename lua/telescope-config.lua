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
			i = {
				["<c-t>"] = trouble.open_with_trouble,
				--[[ ["<c-n>"] = "move_selection_next",
				["<c-p>"] = "move_selection_previous", ]]
				["<c-n>"] = "cycle_history_next",
				["<c-p>"] = "cycle_history_prev",
				["<c-k>"] = "move_selection_previous",
				["<c-j>"] = "move_selection_next",
			},
			n = {
				["<c-t>"] = trouble.open_with_trouble,
				["j"] = "cycle_history_next",
				["k"] = "cycle_history_prev",
			},
		},
		file_ignore_patterns = { ".git" },
		history = {
			path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
			limit = 100,
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		},
		command_history = {
			theme = "dropdown",
		},
	},
	extensions = {
		--[[ frecency = {
			db_root = "/Users/al/.local/share/nvim/databases",
			db_safe_mode = true,
			auto_validate = true,
			show_scores = true,
			default_workspace = "CWD",
			show_unindexed = true,
			ignore_patterns = {
				"*.git/*",
				"*/tmp/*",
				"*/node_modules/*",
				"*/layers/python-efs/python/*",
				"*/layers/python-dependencies/python/*",
				"*/venv/*",
				"*/.venv/*",
				"*/__pycache__/*",
				"*undodir/*",
                "*/sessions*",
                "*.DS_Store",
			},
			disable_devicons = false,
			workspaces = {
                ["al"] = "/Users/al",
				["conf"] = "/Users/al/.config",
				["ai"] = "/Users/al/code/Augintel",
				["wiki"] = "/Users/al/Desktop/vimwiki",
				["code"] = "/Users/al/code",
				["api"] = "/Users/al/code/Augintel/apis",
				["ui"] = "/Users/al/code/Augintel/augintel-ui",
			},
		}, ]]
		fzy_native = {
			override_generic_sorter = true,
			override_file_sorter = true,
		},
	},
})

-- telescope.load_extension("frecency")
telescope.load_extension("fzy_native")
telescope.load_extension("smart_history")
telescope.load_extension("projects")

return M
