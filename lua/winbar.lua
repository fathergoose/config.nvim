function _G.als_winbar()
	local mode = "%-5{%v:lua.string.upper(v:lua.vim.fn.mode())%}"
	local file_name = "%.32t"
	local buf_nr = "[%n]"
	local modified = " %m"
	local file_type = " %y"
	local section = "%="
	local line_no = "%10([%l/%L%)]"
	local pct_thru_file = "%5p%%"
    local italics = "%#@text.emphasis#"

	return string.format("%s%s%s%s%s%s", section, italics, file_name, buf_nr, modified, section)
end

vim.opt.winbar = _G.als_winbar()
