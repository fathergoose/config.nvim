local wk = require("which-key")
wk.setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-n>", -- binding to scroll down inside the popup
		scroll_up = "<c-p>", -- binding to scroll up inside the popup
	},
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 2, 1, 2 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 10, -- transparency of the window (0-100)
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = false, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
	-- disable the WhichKey popup for certain buf types and file types.
	-- Disabled by default for Telescope
	disable = {
		buftypes = {},
		filetypes = { "TelescopePrompt" },
	},

	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
})

wk.register({
	a = {},
	s = {
		name = "Search",
		a = { "<cmd>Telescope<CR>", "Search  all" },
		b = { "<cmd>Telescope buffers<CR>", "Search  buffers" },
		c = { "<cmd>Telescope commands<CR>", "Search commands" },
		f = { "<cmd>Telescope frecency<CR>", "Search frecency" },
		g = { "<cmd>Telescope live_grep<CR>", "Search `grep`" },
		h = { "<cmd>Telescope help_tags<CR>", "Search :help" },
		r = { "<cmd>Telescope command_history<CR>", "Search command_history" },
		p = { "<cmd>Telescope projects<CR>", "Search project directories" },
	},
	d = {},
	f = { name = "Float", e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Float error" } },
	g = {
		name = "Git",
		b = { "<cmd>Git blame<CR>", "git blame" },
		d = { "<cmd>Gitsigns diffthis<CR>", "Diff this file" },
        o = { "<cmd>GBrowse<CR>", "Open in browser" },
	},
	h = { name = "Highlight / Hide", l = { "<cmd>noh<CR>", "Toggle highlight" } },
	j = { name = "Jump", m = { "<cmd>Telescope marks<CR>", "Jump to mark" } },
	k = {},
	l = {
		name = "LSP",
		f = { "<cmd>lua vim.lsp.buf.format({ async = true})<CR>", "Format" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
		e = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Error (line diagnostics)" },
		E = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Errors to loclist" },
		d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
		t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
		i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
		r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
		m = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
	},
	t = {
		name = "Toggle",
		i = { "<cmd>IndentBlanklineToggle<CR>", "Indentation guides" },
		t = { "<cmd>ToggleTerm direction=horizontal<CR>", "Toggle terminal (bottom)" },
		v = { "<cmd>ToggleTerm direction=vertical size=100<CR>", "Vertical split terminal" },
		f = { "<cmd>ToggleTerm direction=float<CR>", "Floating terminal" },
		e = { "<cmd>TroubleToggle<CR>", "Errors (trouble.nvim)" },
		h = { "<cmd>set hlsearch!<CR>", "Highlight search" },
        c = { "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", "Toggle copilot" },
	},
	e = {
		name = "Edit",
		i = { "<cmd>edit $MYVIMRC<CR>", "Edit init.lua" },
		v = { "<cmd>edit $MYVIMRC<CR>", "Edit .vimrc (init.lua)" },
		p = { "<cmd>edit ~/.config/nvim/lua/plugins.lua<CR>", "Edit plugins.lua" },
		m = { "<cmd>edit ~/.config/nvim/lua/mappings.lua<CR>", "Edit mappings.lua" },
		k = { "<cmd>edit ~/.config/nvim/lua/which-key-config.lua<CR>", "Edit which-key-config.lua" },
		s = { "<cmd>edit ~/.config/nvim/lua/settings.lua<CR>", "Edit settings.lua" },
        w = { "<cmd>edit ~/.config/wezterm/wezterm.lua<CR>", "Edit wezterm.lua" },
	},
    z = {
        name = "Zlex (personal misc)",
        m = { [[<cmd>%s//\r/g<cr>]], "Znewlines for ^M" },
    }
}, { prefix = "<leader>" })
