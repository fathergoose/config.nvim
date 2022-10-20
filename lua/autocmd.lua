local termGroup = vim.api.nvim_create_augroup("TermStuff", {})
vim.api.nvim_create_autocmd({ "TermOpen", "TermEnter" }, {
	pattern = "term://*",
	command = "startinsert",
	group = termGroup,
})
vim.api.nvim_create_autocmd({ "TermClose", "TermLeave" }, {
	pattern = "term://*",
	command = "stopinsert",
	group = termGroup,
})

local foldGroup = vim.api.nvim_create_augroup("Folds", {})
vim.api.nvim_create_autocmd("WinEnter", {
	command = "normal zR",
	group = foldGroup,
})
vim.api.nvim_create_autocmd("VimEnter", {
	command = "setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()",
	group = foldGroup,
})

local openAlpha = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.cmd("Alpha")
    vim.api.nvim_buf_delete(buf, { force = true })
    vim.cmd("echom 'Alpha'")
end
local testGroup = vim.api.nvim_create_augroup("TestStuff", {clear = true})
vim.api.nvim_create_autocmd("VimEnter", {
    callback = openAlpha,
	group = testGroup,
    once = true,
})
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "alpha://*",
    command = "setlocal filetype=alpha",
    group = testGroup,
})

local jsGroup = vim.api.nvim_create_augroup("JS/TS", {})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json" },
	command = "setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2",
	group = jsGroup,
})

local luaGroup = vim.api.nvim_create_augroup("luaGroup", {})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua" },
	command = "setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4",
	group = luaGroup,
})

local mdGroup = vim.api.nvim_create_augroup("MDGroup", {})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "vimwiki, markdown" },
	command = "iunmap <buffer> <TAB>",
	group = mdGroup,
})

local textLogGrp = vim.api.nvim_create_augroup("TextLog", {})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "txt" },
	command = "setlocal wrap linebreak nolist",
	group = textLogGrp,
})

local startupGroup = vim.api.nvim_create_augroup("Startup", {})
vim.api.nvim_create_autocmd("User", {
	pattern = "CodiEnterPost",
	command = "lua vim.diagnostic.disable(0)",
	group = startupGroup,
})


local qfGroup = vim.api.nvim_create_augroup("QF", {})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf" },
	command = "set nobuflisted",
	group = qfGroup,
})

--[[ local textChangedGroup = vim.api.nvim_create_augroup("TextChanged", {})
vim.api.nvim_create_autocmd({ "TextChangedI", "TextChangedP" }, {
	group = textChangedGroup,
	callback = function()
		local line = vim.api.nvim_get_current_line()
		local cursor = vim.api.nvim_win_get_cursor(0)[2]

		local current = string.sub(line, cursor, cursor + 1)
		if current == "." or current == "," or current == " " then
			require("cmp").close()
		end

		local before_line = string.sub(line, 1, cursor + 1)
		local after_line = string.sub(line, cursor + 1, -1)
		if not string.match(before_line, "^%s+$") then
			if after_line == "" or string.match(before_line, " $") or string.match(before_line, "%.$") then
				require("cmp").complete()
			end
		end
	end,
	pattern = "*",
}) ]]


local alphaReadyGroup = vim.api.nvim_create_augroup("AlphaReady", {})
vim.api.nvim_create_autocmd("User", {
	pattern = "AlphaReady",
	callback = function()
		local alpha_win = vim.api.nvim_get_current_win()
        require("neonews").check_news()
		vim.api.nvim_set_current_win(alpha_win)
	end,
	group = alphaReadyGroup,
})
