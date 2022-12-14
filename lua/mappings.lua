_G.CarbonIsFloating = false

_G.GetFloatingWindows = function()
    local floating_windows = {}
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local config = vim.api.nvim_win_get_config(win)
		if config.relative ~= "" then -- is_floating_window?
            table.insert(floating_windows, win)
		end
	end
    return floating_windows
end
local closeAllFloatingWindows = function()
    local win = _G.GetFloatingWindows()
    if win ~= nil then
        for _, w in ipairs(win) do
            vim.api.nvim_win_close(w, true)
        end
    end
end

_G.ToggleCarbon = function()
	if _G.CarbonIsFloating then
		closeAllFloatingWindows()
		_G.CarbonIsFloating = false
	else
		require("carbon").explore_float({
			always_reveal = true,
		})
		_G.CarbonIsFloating = true
	end
end

local opts = { noremap = true, silent = true }

--Normal
vim.api.nvim_set_keymap("n", "<C-n>", ":lua ToggleCarbon()<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>", opts)
vim.api.nvim_set_keymap("c", "<C-r>", ":Telescope command_history<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>ek", ":e ~/.config/nvim/lua/mappings.lua<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>ep", ":e ~/.config/nvim/lua/plugins.lua<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>ef", ":e ~/.config/nvim/lua/", { noremap = true })
vim.api.nvim_set_keymap("n", "<esc>", ":noh<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>x", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-h>", ":bprevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-l>", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<m-h>", "25zh", opts)
vim.api.nvim_set_keymap("n", "<m-l>", "25zl", opts)
vim.api.nvim_set_keymap("n", "j", "gj", opts)
vim.api.nvim_set_keymap("n", "k", "gk", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>l", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Space>", "<cmd>Telescope<CR>", opts)

vim.api.nvim_set_keymap("n", "<C-/>", "mzI//<space><esc>`z3l", { noremap = true, silent = true })

--Terminal
vim.api.nvim_set_keymap("t", "<C-w>", "<C-\\><C-n><C-w>", opts)
vim.api.nvim_set_keymap("t", "<C-c>", "<C-c><C-\\><C-n>", opts)

-- Insert
vim.api.nvim_set_keymap("i", "<C-c>", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-.>", "<ESC>>>A", opts)
vim.api.nvim_set_keymap("i", "<C-/>", "<esc>mzI//<space><esc>`z3li", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-t>", "<ESC>:new<CR>", opts)
vim.api.nvim_set_keymap("i", "<C-b>", "<Left>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-f>", "<Right>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-a>", "<C-o>:call Emacs_bindings_home()<CR>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-e>", "<End>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-d>", "<Del>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-h>", "<BS>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-u>", "<space><esc>ld0i", { silent = true })
vim.api.nvim_set_keymap("i", "<C-y>", "<c-r>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-Space>", "<c-o>:lua require('copilot.suggestion').toggle_auto_trigger()<CR>", { silent = false, noremap=true })
vim.api.nvim_set_keymap("!", "<C-@>", "<C-Space>", { silent = false, noremap=false })

-- vim.api.nvim_set_keymap("i", "<C-k>", "<C-r>=Emacs_bindings_kill_line()<CR>>", { silent = true })
-- vim.api.nvim_set_keymap("i", "<C-j>", "<C-o>:lua vim.lsp.buf.completion()<CR>", opts)

--Command
vim.api.nvim_set_keymap("c", "<C-b>", "<Left>", {})
vim.api.nvim_set_keymap("c", "<C-f>", "<Right>", {})
vim.api.nvim_set_keymap("c", "<C-a>", "<Home>", {})
vim.api.nvim_set_keymap("c", "<C-e>", "<End>", {})
vim.api.nvim_set_keymap("c", "<C-d>", "<Del>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-h>", "<BS>", { noremap = true })
vim.api.nvim_set_keymap("c", "<M-f>", "<C-f>", { noremap = true })

vim.cmd([[
cabbrev desk ~/Desktop


function! Emacs_bindings_home()
  let start_col = col('.')
  normal! ^
  if col('.') == start_col
    normal! 0
  endif
  return ''
endfunction

function! Emacs_bindings_kill_line()
  let [text_before_cursor, text_after_cursor] = Emacs_bindings_split_line_text_at_cursor()
  if len(text_after_cursor) == 0
    normal! J
  else
    call setline(line('.'), text_before_cursor)
  endif
  return ''
endfunction

function! Emacs_bindings_split_line_text_at_cursor()
  let line_text = getline(line('.'))
  let text_after_cursor  = line_text[col('.')-1 :]
  let text_before_cursor = (col('.') > 1) ? line_text[: col('.')-2] : ''
  return [text_before_cursor, text_after_cursor]
endfunction
]])
