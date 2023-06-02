local wk = require("which-key")
local colors = require("catppuccin.palettes").get_palette()
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

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "double",
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
	-- function to run on closing the terminal
	on_close = function(_term)
		vim.cmd("startinsert!")
	end,
})
function _lazygit_toggle()
	lazygit:toggle()
end
local function toggle_foldcolumn()
	if vim.wo.foldcolumn == 0 then
		vim.wo.foldcolumn = "auto"
	else
		vim.wo.foldcolumn = 0
	end
end
wk.register({
	v = { name = "View", f = { toggle_foldcolumn, "Toggle foldcolumn" } },
	s = {
		name = "Search",
		a = { "<cmd>Telescope<CR>", "Search  all" },
		b = { "<cmd>Telescope buffers<CR>", "Search  buffers" },
		c = { "<cmd>Telescope commands<CR>", "Search commands" },
		["<space>"] = { "<cmd>Telescope<CR>", "Search Pickers" },
		f = { "<cmd>Telescope frecency<CR>", "Search frecency" },
		g = { "<cmd>Telescope live_grep<CR>", "Search `grep`" },
		h = { "<cmd>Telescope help_tags<CR>", "Search :help" },
		r = { "<cmd>Telescope command_history<CR>", "Search command_history" },
		p = { "<cmd>Telescope projects<CR>", "Search project directories" },
		o = { "<cmd>ObsidianSearch<CR>", "Search Obsidian" },
	},
	d = {
		name = "    Debug/DAP",
		b = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle breakpoint" },
		B = { "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "Set breakpoint" },
		c = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
		i = { "<cmd>lua require('dap').step_into()<CR>", "Step into" },
		o = { "<cmd>lua require('dap').step_over()<CR>", "Step over" },
		u = { "<cmd>lua require('dap').step_out()<CR>", "Step out" },
		r = { "<cmd>lua require('dap').repl.open()<CR>", "Open REPL" },
	},
	f = { name = "Float", e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Float error" } },
	g = {
		name = "Git",
		b = { "<cmd>Git blame<CR>", "git blame" },
		d = { "<cmd>Gitsigns diffthis<CR>", "Diff this file" },
		l = { "<cmd>Gitsigns blame_line<CR>", "Blame line" },
		o = { "<cmd>GBrowse<CR>", "Open in browser" },
		z = { "<cmd>lua _lazygit_toggle()<CR>", "Lazygit" },
	},
	r = {
		name = "Run",
		t = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "This file" },
		r = { "<cmd>lua require('neotest').run.run()<CR>", "All tests" },
        h = { "<cmd>lua require('neotest').run.run"},
        l = { "<cmd>lua require('neotest').run.run_last()<CR>", "Last test" },
        s = { "<cmd>lua require('neotest').summary.toggle()<CR>", "Summary" },
	},
	h = { name = "Highlight / Hide", l = { "<cmd>noh<CR>", "Toggle highlight" } },
	j = { name = "Jump", m = { "<cmd>Telescope marks<CR>", "Jump to mark" } },
	k = {
		name = "idK",
		k = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
		f = { "<cmd>lua vim.lsp.buf.signature_help", "Function signature help" },
	},
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
		o = { "<cmd>LspStop<CR>", "Off" },
		O = { "<cmd>LspStart<CR>", "On" },
	},
	t = {
		name = "Toggle",
		i = { "<cmd>IndentBlanklineToggle<CR>", "Indentation guides" },
		t = { "<cmd>ToggleTerm direction=horizontal<CR>", "Toggle terminal (bottom)" },
		v = { "<cmd>ToggleTerm direction=vertical size=160<CR>", "Vertical split terminal" },
		f = { "<cmd>ToggleTerm direction=float<CR>", "Floating terminal" },
		e = { "<cmd>TroubleToggle<CR>", "Errors (trouble.nvim)" },
		h = { "<cmd>set hlsearch!<CR>", "Highlight search" },
		c = { "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", "Toggle copilot" },
		C = {
			"<cmd>hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg="
				.. colors["mantle"]
				--[[ .. " guifg="
				.. colors["lavender"] ]]
				.. " | set cursorline! <CR>",
			"Toggle cursorline",
		},
		a = { "<cmd>AerialToggle<CR>", "Toggle aerial" },
		A = { "<cmd>AerialToggle!<CR>", "Toggle aerial = but don't focus" },
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint" },
		B = {
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
			"Set breakpoint with condition",
		},
	},
	e = {
		name = "Edit",
		c = { "<cmd>edit ~/.config/nvim/lua/colors.lua<CR>", "Edit config.lua" },
		v = { "<cmd>edit $MYVIMRC<CR>", "Edit .vimrc (init.lua)" },
		p = { "<cmd>edit ~/.config/nvim/lua/plugins.lua<CR>", "Edit plugins.lua" },
		m = { "<cmd>edit ~/.config/nvim/lua/mappings.lua<CR>", "Edit mappings.lua" },
		k = { "<cmd>edit ~/.config/nvim/lua/which-key-config.lua<CR>", "Edit which-key-config.lua" },
		s = { "<cmd>edit ~/.config/nvim/lua/settings.lua<CR>", "Edit settings.lua" },
		w = { "<cmd>edit ~/.config/wezterm/wezterm.lua<CR>", "Edit wezterm.lua" },
		i = { "<cmd>edit ~/Documents/ObsidianVault/Inbox.md<CR>", "Edit Inbox" },
	},
	o = {
		name = "Obsidian",
		i = { "<cmd>edit ~/Documents/ObsidianVault/Inbox.md<CR>", "Inbox" },
		d = { "<cmd>ObsidianToday<cr>", "Daily Note" },
	},
	w = {
		name = "Windows",
		h = { "<cmd>wincmd h<CR>", "Window left" },
		j = { "<cmd>wincmd j<CR>", "Window down" },
		k = { "<cmd>wincmd k<CR>", "Window up" },
		l = { "<cmd>wincmd l<CR>", "Window right" },
		s = { "<cmd>split<CR>", "Split" },
		v = { "<cmd>vsplit<CR>", "Vsplit" },
		c = { "<cmd>close<CR>", "Close" },
		o = { "<cmd>only<CR>", "Only" },
		["="] = { "<cmd>resize +5<CR>", "Increase height" },
		["-"] = { "<cmd>resize -5<CR>", "Decrease height" },
		["+"] = { "<cmd>vertical resize +5<CR>", "Increase width" },
		["_"] = { "<cmd>vertical resize -5<CR>", "Decrease width" },
	},
	z = {
		name = "Zlex (personal misc)",
		m = { [[<cmd>%s/ /\r/g<cr>]], "Znewlines for ^M" },
		z = { [[<cmd>ZenMode<cr>]], "Zen mode toggle" },
	},
}, { prefix = "<leader>" })

-- Put this with which-key-config
vim.keymap.set("n", "gf", function()
	if require("obsidian").util.cursor_on_markdown_link() then
		return "<cmd>ObsidianFollowLink<CR>"
	else
		return "gf"
	end
end, { noremap = false, expr = true })

--[[ d = {function()
    local file = os.date("%Y-%m-%d")
    vim.cmd("edit ~/Documents/ObsidianVault/Notebook/" .. file .. ".md")
end, "Edit Today's Note" }, ]]
