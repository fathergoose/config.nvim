-- Author: Al Ilseman
-- License: MIT
-- Description: Open netrw in a floating window
-- Inspiration from:
-- https://vi.stackexchange.com/questions/36594/how-do-i-open-an-existing-file-in-a-floating-window

-- TODO:
-- [x] Autocommand to close window when losing focus
-- [x] Map <esc> to close window
-- [x] Add a keymap to open the explorer (<C-n>)
-- [x] Add a keymap to toggle the explorer (<C-n>)
-- [ ] Close the window on file open
-- [ ] Refactor this code to be more functional
--
local buf, win

local function open_win()
	buf = vim.api.nvim_create_buf(false, true)

	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

	local width = vim.api.nvim_get_option("columns")
	local height = vim.api.nvim_get_option("lines")

	local win_height = math.ceil(height * 0.5 - 4)
	local win_width = math.ceil(width * 0.3)

	local row = math.ceil((height - win_height) / 2 - 1)
	local col = math.ceil((width - win_width) / 2)

	--[[ • style: Configure the appearance of the window. Currently
    only takes one non-empty value:
    • "minimal" Nvim will display the window with many UI
      options disabled. This is useful when displaying a
      temporary float where the text should not be edited.
      Disables 'number', 'relativenumber', 'cursorline',
      'cursorcolumn', 'foldcolumn', 'spell' and 'list'
      options. 'signcolumn' is changed to `auto` and
      'colorcolumn' is cleared. The end-of-buffer region is
      hidden by setting `eob` flag of 'fillchars' to a space
      char, and clearing the |hl-EndOfBuffer| region in
      'winhighlight'. ]]

	local opts = {
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col,
		border = "rounded",
	}

	win = vim.api.nvim_open_win(buf, true, opts)
end

local function view()
	vim.api.nvim_buf_set_option(0, "modifiable", true)
	vim.cmd("Explore")
	vim.api.nvim_win_set_option(win, "cursorline", true)
	vim.api.nvim_win_set_option(win, "number", false)
	vim.api.nvim_win_set_option(win, "relativenumber", false)
	vim.api.nvim_win_set_option(win, "cursorcolumn", false)
	vim.api.nvim_win_set_option(win, "foldcolumn", "0")
	vim.api.nvim_win_set_option(win, "spell", false)
	vim.api.nvim_win_set_option(win, "list", false)
	vim.api.nvim_win_set_option(win, "signcolumn", "auto")
	vim.api.nvim_win_set_option(win, "colorcolumn", "")
	vim.api.nvim_buf_set_option(0, "filetype", "netrw.float")
	vim.api.nvim_win_set_option(win, "winblend", 0)
	vim.api.nvim_win_set_option(win, "winhl", "EndOfBuffer:Normal")
	vim.api.nvim_buf_set_option(0, "modifiable", false)
end

local function float_explorer()
	open_win()
	view()
end

local floatGroup = vim.api.nvim_create_augroup("Floats", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "netrw.float" },
	command = "nnoremap <buffer> <silent> <esc> :lua _G.ToggleNetrwFloat()<CR>",
	group = floatGroup,
})

vim.api.nvim_create_autocmd("BufLeave", {
	pattern = { "/Users/al/.config/nvim/NetrwTreeListing" },
	group = floatGroup,
	callback = function(args)
		print("BufLeave")
		local wins = _G.GetFloatingWindows()
		buf = vim.api.nvim_win_get_buf(wins[1])
		if buf == args.buf then
			_G.ToggleNetrwFloat()
		end
	end,
})

vim.api.nvim_create_autocmd("WinEnter", {
	pattern = "*",
	group = floatGroup,
	callback = function(args)
        print("WinEnter")
		local wins = _G.GetFloatingWindows()
		if #wins > 0 then
			buf = vim.api.nvim_win_get_buf(wins[1])
			if buf == args.buf then
				_G.ToggleNetrwFloat()
			end
		end
	end,
})

vim.api.nvim_set_keymap("n", "<C-n>", ":lua _G.ToggleNetrwFloat()<CR>", { noremap = true, silent = true })

_G.NetrwIsFloating = false

_G.GetFloatingWindows = function()
	local floating_windows = {}
	for _, window in ipairs(vim.api.nvim_list_wins()) do
		local config = vim.api.nvim_win_get_config(window)
		if config.relative ~= "" then -- is_floating_window?
			table.insert(floating_windows, window)
		end
	end
	return floating_windows
end
local closeAllFloatingWindows = function()
	local windows = _G.GetFloatingWindows()
	if windows ~= nil then
		for _, w in ipairs(windows) do
			vim.api.nvim_win_hide(w)
		end
	end
end

_G.ToggleNetrwFloat = function()
	if _G.NetrwIsFloating then
		closeAllFloatingWindows()
		_G.NetrwIsFloating = false
	else
		float_explorer()
		_G.NetrwIsFloating = true
	end
end

local defaults = {}
_G.FExplore = float_explorer
vim.cmd("command! -nargs=0 FExplore lua _G.FExplore()")
vim.cmd("command! -nargs=0 ToggleNetrwFloat lua _G.ToggleNetrwFloat()")
vim.api.nvim_set_keymap("n", "<C-n>", ":ToggleNetrwFloat<CR>", { noremap = true, silent = true })

return {
	float_explorer = float_explorer,
	setup = function(opts)
		defaults = vim.tbl_deep_extend("force", defaults, opts or {})
	end,
}
