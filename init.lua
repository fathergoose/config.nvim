vim.api.nvim_set_option("termguicolors", true)
vim.cmd([[
set guifont=MonoLisaOne\ Nerd\ Font:h14
]])

vim.lsp.set_log_level("debug")

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
require("mappings")
require("which-key-config")
require("toggle-term-config")
require("color-picker-config")
require("lualine-config")
require("zen-mode-config")
require("treesitter-context").setup({})
require("neoscroll").setup({
	easing_function = "sine", -- Default easing function
})
require("nvim-lastplace").setup({})
require("gitsigns-config")
require("colorizer").setup({}, { css = true })
-- require("telescope").load_extension("projects")
require("alpha-config")

vim.cmd("noremap <f1> <nop>")
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

vim.cmd("command! Vt vsp term://zsh")
vim.cmd("command! Ps w | so | PackerInstall | PackerCompile")

local function vimwikiDiaryNoteWithName()
	vim.cmd("VimwikiMakeDiaryNote")
	vim.cmd("put =strftime('# %A, %B %d, %Y')")
	vim.cmd("normal kdd")
end

-- put =strftime('# %A, %B %d, %Y')
-- # Friday, February 03, 2023
-- put =strftime("%Y-%m-%d %H:%M")
-- 2023-02-03 03:44
local function dateHead()
	return vim.fn.strftime("# %A, %B %d, %Y")
end
local function eightDigitTimestamp()
	return vim.fn.strftime("%T")
end

vim.api.nvim_create_user_command("DateHead", dateHead, {})
vim.api.nvim_create_user_command("EightDigitTimestamp", eightDigitTimestamp, {})

vim.cmd('nmap <leader>it a<C-R>=strftime("%T")<CR><Esc>')
vim.cmd('nmap <leader>id a<C-R>=strftime("# %A, %B %d, %Y")<CR><Esc>')

vim.api.nvim_create_user_command("Diary", vimwikiDiaryNoteWithName, {})

require("transparent").setup({
	extra_groups = {
		"all",
		"GitSignsAdd",
		"GitSignsChange",
		"GitSignsDelete",
		"FloatShadowThrough",
		"FloatShadow",
		"help",
		"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
		"NvimTreeNormal",
	},
	exclude_groups = {},
})

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
]])

require("autocmd")

require("obsidian").setup({
	dir = "~/Documents/ObsidianVault/",
	completion = {
		nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
	},
	daily_notes = {
		folder = "Notebook",
	},
	use_advaced_uri = true,
	note_id_func = function(title)
		-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
		local suffix = ""
		if title ~= nil then
			-- If title is given, transform it into valid file name.
			suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		else
			-- If title is nil, just add 4 random uppercase letters to the suffix.
			for _ = 1, 4 do
				suffix = suffix .. string.char(math.random(65, 90))
			end
		end
		return tostring(os.date("%y%m%dT%H%M%S"))
	end,
})

require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "markdown" },
	},
})

require("dap-config")
require("neodev").setup({
	library = { plugins = { "nvim-dap-ui" }, types = true },
	...,
})

require("dressing").setup({
	select = {
		get_config = function(opts)
			if opts.kind == "legendary.nvim" then
				return {
					telescope = {
						sorter = require("telescope.sorters").fuzzy_with_index_bias({}),
					},
				}
			else
				return {}
			end
		end,
	},
})

require("colors")
-- vim.cmd("colorscheme onedark")
local neogit = require("neogit")
neogit.setup({})
require("project_nvim-config")

require("aerial-config")
require("lsp-config")
require("better-folding")
require("chatGPT-config")

vim.cmd([[
    aunmenu PopUp.How-to\ disable\ mouse
    aunmenu PopUp.Select\ All
    if &mousemodel =~? 'popup'
        anoremenu <silent> PopUp.Go\ to\ Definition
        \ <cmd>LspDef<CR>
        anoremenu <silent> PopUp.Go\ to\ Declaration
        \ <cmd>lua vim.lsp.buf.declaration()<CR>
        anoremenu <silent> PopUp.Find\ All\ References
        \ <cmd>LspRefs<CR>
        anoremenu <silent> PopUp.Show\ Detail
        \ <cmd>LspHover<CR>
    endif

]])

vim.cmd([[

	set tabline=%!MyTabLine()

" Then define the MyTabLine() function to list all the tab pages labels.  A
" convenient method is to split it in two parts:  First go over all the tab
" pages and define labels for them.  Then get the label for each tab page.

	function MyTabLine()
	  let s = ''
	  for i in range(tabpagenr('$'))
	    " select the highlighting
	    if i + 1 == tabpagenr()
	      let s ..= '%#TabLineSel#'
	    else
	      let s ..= '%#TabLine#'
	    endif

	    " set the tab page number (for mouse clicks)
	    let s ..= '%' .. (i + 1) .. 'T'

	    " the label is made by MyTabLabel()
	    let s ..= ' %{MyTabLabel(' .. (i + 1) .. ')} '
	  endfor

	  " after the last tab fill with TabLineFill and reset tab page nr
	  let s ..= '%#TabLineFill#%T'

	  " right-align the label to close the current tab page
	  if tabpagenr('$') > 1
	    let s ..= '%=%#TabLine#%999Xclose'
	  endif

	  return s
	endfunction

" Now the MyTabLabel() function is called for each tab page to get its label

	function MyTabLabel(n)
	  let buflist = tabpagebuflist(a:n)

      " TODO: use winlayout() to get the layout of the tabpage

	  let winnr = tabpagewinnr(a:n)
      let additional = tabpagewinnr(a:n, '$') - 1
      let l:layout_symbol = ''
      if additional == 1
          if winlayout(a:n)[0] == 'col'
              let l:layout_symbol = '􀧊  '
          else
              let l:layout_symbol = '􀧈  '
          endif
      elseif additional == 2
          let l:izero = winlayout(a:n)[0]
          if l:izero == 'col' || l:izero[1] == 'row' || l:izero[1][1] == 'row'
             let l:layout_symbol = '􀏝  '
          else
              let l:layout_symbol = '􀏟  '
          endif
      elseif additional == 3
          let l:layout_symbol = '􀧌  '
      elseif additional >= 4
          let l:layout_symbol = '􀏢  '
      else
          let l:layout_symbol = '􀏚  '
      endif
      let extra_count = additional > 0 ? ' +' .. additional : ''
      return a:n .. " " .. l:layout_symbol .. luaeval('vim.fs.basename("' .. bufname(buflist[winnr - 1]) ..'")') .. extra_count
	endfunction

]])

vim.cmd([[
nnoremap <M-m> :RnvimrToggle<CR>
]])
