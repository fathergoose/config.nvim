vim.api.nvim_set_option("termguicolors", true)
-- Disable some builtin vim plugins
vim.cmd([[
if exists('$VIMRUNNING') && ! has('gui_running')
    cq! 1
else
    let $VIMRUNNING = 1
endif
]])

vim.cmd("let g:loaded_sql_completion = -1")
vim.g.loaded = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"tar",
	"tarPlugin",
	"rrhelper",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}
vim.cmd("runtime macros/matchit.vim")

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

require("plugins")
require("settings")
require("winbar")
require("nvim-tree-config")
require("telescope-config")
require("cmp-config")
require("lsp-config")
require("mappings")
require("which-key-config")
require("toggle-term-config")
require("color-picker-config")
require("lualine-config")
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
require("psql").setup({
	database_name = "warehouse",
	user = "postgres",
	host = "127.0.0.1",
	port = 5432,
})

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

-- vim.cmd("colorscheme solarized")
-- require('monokai').setup { palette = require('monokai').pro }
-- vim.cmd('colorscheme base16-seti')

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
			"FloatShadowThrough",
			"FloatShadow",
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

vim.cmd([[
  let g:copilot_no_tab_map = v:true
  imap <expr> <Plug>(vimrc:copilot-dummy-map) copilot#Accept("\<Tab>")
]])

vim.cmd([[
function! SynStack()
        if !exists("*synstack")
            return
        endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
]])

vim.cmd([[
let g:minimap_width = 10
let g:minimap_auto_start = 0
let g:minimap_auto_start_win_enter = 1
let g:minimap_block_buftypes = ['nofile', 'nowrite', 'quickfix', 'terminal', 'prompt']
let g:minimap_close_filetypes = ['help', 'packer', 'qf', 'alpha', 'tagbar', 'undotree', 'vim-plug']
let g:minimap_git_colors = 1
let g:minimap_highlight_range = 1
]])

vim.cmd([[
    set mouse=a
    behave xterm
"    set mousemodel=popup
"    aunmenu PopUp
"    anoremenu PopUp.GoToDefinition              <Cmd>lua vim.lsp.buf.definition()<CR>
"    vnoremenu PopUp.Cut                         "+x
"    vnoremenu PopUp.Copy                        "+y
"    anoremenu PopUp.Paste                       "+gP
"    vnoremenu PopUp.Paste                       "+P
"    vnoremenu PopUp.Delete                      "_x
]])
	--[[ vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
	vim.cmd("command! LspFormatting lua vim.lsp.buf.format()")
	vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
	vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
	vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
	vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
	vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
	vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
	vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
	vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
	vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
	vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()") ]]

--[[
-- Other options for the popup menu
    nnoremenu PopUp.Select\ All>                ggVG
    vnoremenu PopUp.Select\ All>                gg0oG$
    inoremenu PopUp.Select\ All                 <C-Home><C-O>VG
    anoremenu PopUp.-1-                         <Nop>
    anoremenu PopUp.How-to\ disable\ mouse      <Cmd>help disable-mouse<CR>
]]

require("autocmd")
