local o = vim.opt
o.ignorecase = true
o.wrap = false
o.smartcase = true
o.hidden = true
o.autoindent = true
o.number = true
o.splitbelow = true
o.splitright = true
o.title = true
o.wildmenu = true
o.ttyfast = true
o.spell = false
o.clipboard = "unnamedplus"
o.completeopt = "menu,menuone,noselect"
o.inccommand = "split"
o.mouse = "a"
o.signcolumn = "yes"
o.expandtab = true -- "In Insert mode: Use the appropriate number of spaces to insert a <Tab>."
o.tabstop = 2 -- "Number of spaces that a <Tab> in the file counts for."
o.softtabstop = 2 -- "Number of spaces that a <Tab> counts for while performing editing operations"
o.shiftwidth = 2 -- "Number of spaces to use for each step of (auto)indent."
o.timeoutlen = 500
o.conceallevel = 2
o.cmdheight = 1
o.foldmethod = "expr"
o.foldlevel = 99
o.shortmess = "aITsWcFS"
--[[
-- a -> all abrivations
-- I -> no intro
-- T -> centered truncation
-- s -> no search hit BOTTOM/TOP
-- W -> :silent exec "w"
-- c -> no ins-completion-menu
-- F -> no file-reading message
-- S -> no search count e.g. [1/3]
-- ]]

-- vim.cmd("set cursorline")
vim.cmd("syntax enable")
vim.cmd("filetype plugin on")

-- Misc Variables
vim.cmd("let &t_ut=''")
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.ftplugin_sql_omni_key = "<C-j>"
vim.g.bargreybars_auto = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_altv = 1
vim.g.netrw_browse_split = 4
vim.g.netrw_fastbrowse = 0

-- GitGutter
vim.g.gitgutter_sign_added = "+"
vim.g.gitgutter_sign_modified = ">"
vim.g.gitgutter_sign_removed = "-"
vim.g.gitgutter_sign_removed_first_line = "^"
-- vim.api.nvim_buf_set_option("modifiable")
vim.g.gitgutter_sign_modified_removed = "<"
vim.g.copilot_filetypes = { markdown = false, vimwiki = false }

-- ttodo_vim
-- vim.cmd("let g:ttodo#dirs = {'/Users/al/Desktop/ToDoTxt': {} }")
vim.g["ttodo#dirs"] = "/Users/al/Desktop/Todos"

-- VimWiki
vim.g.vimwiki_list = {
	{
		path = "~/Desktop/vimwiki",
		template_path = "~/Desktop/vimwiki/templates/",
		template_default = "default",
		syntax = "markdown",
		ext = ".md",
		path_html = "~/Desktop/vimwiki/site_html/",
		custom_wiki2html = "/Users/al/.pyenv/versions/3.8.13/bin/vimwiki_markdown",
		template_ext = ".tpl",
	},
}

-- vim.cmd("let g:mkdx#settings = { 'highlight': { 'enable': 1 } }")
vim.cmd([[
let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'enter': { 'shift': 1 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        \ 'fold': { 'enable': 0 },
                        \ 'tokens': { 'strike': '~~' } }

let g:table_mode_corner='|'
]])

vim.g.neovide_cursor_trail_size = 0.5
vim.g.neovide_cursor_animation_length = 0.1
vim.cmd("let g:neovide_input_use_logo=v:true")
vim.api.nvim_set_option("guifont", "SFMono Nerd Font:h14")
vim.api.nvim_set_option("undofile", true)
vim.api.nvim_set_option("undodir", "/Users/al/.config/nvim/undodir")
