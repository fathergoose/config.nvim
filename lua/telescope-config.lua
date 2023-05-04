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
				["<c-n>"] = "move_selection_next",
				["<c-p>"] = "move_selection_previous",
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
		-- It's a shame, but I just don't get how to use this
		-- I think bat is the default anyway
		--[[ file_previewer = require("telescope.previewers").new_termopen_previewer({
            get_command = function(entry, status)
                return { "bat", entry.path }
            end,
        }).new, ]]
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		},
		frecency = {
			theme = "dropdown",
		},
		command_history = {
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
telescope.load_extension("smart_history")
telescope.load_extension("projects")

return M
