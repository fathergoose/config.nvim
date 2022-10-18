vim.api.nvim_set_option("termguicolors", true)
-- Disable some builtin vim plugins

vim.g.loaded = 1
-- vim.g.loaded_netrwPlugin = 1
local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	--[[ "netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers", ]]
	"matchit",
	--"matchparen",
	"tar",
	"tarPlugin",
	"rrhelper",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

require("plugins")
require("settings")
require("autocmd")
require("winbar")
-- require("nvim-tree-config")
require("telescope-config")
require("cmp-config")
require("lsp-config")
require("mappings")
require("which-key-config")
require("toggle-term-config")
require("color-picker-config")
require("lualine-config")
require("todo-comments-config")
require("zen-mode-config")
require("symbols-outline-config")
require("treesitter-context").setup({})
require("neoscroll").setup({
	easing_function = "sine", -- Default easing function
})
require("nvim-lastplace").setup({})
require("gitsigns-config")
require("colorizer").setup({}, { css = true })
require("telescope").load_extension("projects")

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- Use the "sine" easing function
t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "350", [['sine']] } }
t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "350", [['sine']] } }
-- Use the "circular" easing function
t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "500", [['sine']] } }
t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "500", [['sine']] } }
-- Pass "nil" to disable the easing animation (constant scrolling speed)
t["<C-y>"] = { "scroll", { "-0.10", "false", "100", [['sine']] } }
t["<C-e>"] = { "scroll", { "0.10", "false", "100", [['sine']] } }
-- When no easing function is provided the default easing function (in this case "quadratic") will be used
t["zt"] = { "zt", { "300" } }
t["zz"] = { "zz", { "300" } }
t["zb"] = { "zb", { "300" } }

require("neoscroll.config").set_mappings(t)

require("notify").setup({
	background_colour = "#999999", --"#1c1c1c",
})
vim.g.diagnostics_visible = true
function _G.toggle_diagnostics()
	if vim.g.diagnostics_visible then
		vim.g.diagnostics_visible = false
		vim.diagnostic.disable()
		vim.o.laststatus = 0
		vim.o.showtabline = 0
	else
		vim.g.diagnostics_visible = true
		vim.diagnostic.enable()
		vim.o.laststatus = 2
		vim.o.showtabline = 2
	end
end

require("rose-pine").setup({
	--- @usage 'main' | 'moon'
	dark_variant = "moon",
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = "base",
		panel = "surface",
		border = "highlight_med",
		comment = "muted",
		link = "iris",
		punctuation = "subtle",

		error = "love",
		hint = "iris",
		info = "foam",
		warn = "gold",

		headings = {
			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	highlight_groups = {
		ColorColumn = { bg = "rose" },
	},
})
-- vim.cmd("colorscheme rose-pine")
vim.cmd("colorscheme solarized")

vim.cmd("command! Vt vsp term://zsh")
vim.cmd("command! Ps w | so | PackerInstall | PackerCompile")

local function vimwikiDiaryNoteWithName()
	vim.cmd("VimwikiMakeDiaryNote")
	vim.cmd("put =strftime('# %A, %B %d, %Y')")
	vim.cmd("normal kdd")
end

vim.api.nvim_create_user_command("Diary", vimwikiDiaryNoteWithName, {})

if vim.g.neovide then
	require("transparent").setup({
		enable = true, -- boolean: enable transparent
		extra_groups = {
			-- "all",
			"LineNR",
			--[[ "GitSignsAdd",
            "GitSignsChange",
            "GitSignsDelete", ]]
		},
		exclude = { "Normal" },
	})
	vim.cmd([[
        set winblend=100
        set pumblend=100
        let g:neovide_hide_mouse_when_typing = v:true
        let g:neovide_floating_blur_amount_x = 2.0
        let g:neovide_floating_blur_amount_y = 2.0
        let g:neovide_remember_window_size = v:true
        let g:neovide_transparency = 0.0
        let g:transparency = 0.8
        let g:neovide_background_color = '#002b36'.printf('%x', float2nr(255 * g:transparency))
        set guifont=Rec\ Mono\ Casual:h15
        hi Normal guibg='#002b36'
        set cmdheight=0
    ]])

	vim.cmd("cd /Users/al/Desktop/vimwiki")
	vim.api.nvim_set_keymap("!", "<D-c>", '"+y', {})
	vim.api.nvim_set_keymap("v", "<D-c>", '"+y', {})
	vim.api.nvim_set_keymap("n", "<D-c>", '"+yy', {})
	vim.api.nvim_set_keymap("n", "<D-v>", '"+p', {})
	vim.api.nvim_set_keymap("i", "<D-v>", "<c-r>+", { noremap = true })
	vim.api.nvim_set_keymap("n", "<D-v>", "<c-r>+", { noremap = true })
	vim.api.nvim_set_keymap("t", "<D-v>", "<c-r>+", { noremap = true })
else
	require("transparent").setup({
		enable = true, -- boolean: enable transparent
		extra_groups = {
			"all",
			"GitSignsAdd",
			"GitSignsChange",
			"GitSignsDelete",
		},
		exclude = {},
	})
end

local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			-- Hover actions
			vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})

--[[ vim.ui_attach(
  vim.api.nvim_create_namespace("redirect messages"),
  { ext_messages = true },
  function(event, ...)
    if event == "msg_show" then
      local level = vim.log.levels.INFO
      local kind, content = ...
      if string.find(kind, "err") then
        level = vim.log.levels.ERROR
      end
      vim.notify(content, level, { title = "Message" })
    end
  end
) ]]
