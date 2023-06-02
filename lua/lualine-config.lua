local custom_solarized = require("lualine.themes.solarized")
-- local onedark = require("lualine.themes.onedark")
custom_solarized.normal.c.bg = "NONE"
custom_solarized.normal.b.fg = "#869396" -- Base1
custom_solarized.normal.b.bg = "#193541" -- Base02

function _G.getTime()
	return vim.fn.strftime("%Y-%m-%d %a %I:%M %p %Z")
end

local function get_max_length()
	local width = vim.fn.winwidth(0)
	return width - 30
end

function string:split(inSplitPattern)
	local outResults = {}
	local theStart = 1
	local theSplitStart, theSplitEnd = string.find(self, inSplitPattern, theStart)
	while theSplitStart do
		table.insert(outResults, string.sub(self, theStart, theSplitStart - 1))
		theStart = theSplitEnd + 1
		theSplitStart, theSplitEnd = string.find(self, inSplitPattern, theStart)
	end
	table.insert(outResults, string.sub(self, theStart))
	return outResults
end

local function mypwd()
	local abs_fpath = vim.fn.expand("%:p")
	local home = vim.fn.expand("$HOME")
	local path_components = abs_fpath:gsub(home, "~"):split("/")
	-- /etc/some/path/w.o/tilde/expansion.cfg
	-- {etc, some, path, w.o, tilde, expansion.cfg}
	-- ~/code/augintel/example/of/a/long/path/to/file.txt
	-- {~, code, augintel, example, of, a, long, path, to, file.txt}
    local abbrivated_path = {}
	for idx, node in ipairs(path_components) do
		-- path_components[1]== "" OR "~"
		-- path_components[2] == "first directory under ~ or /"
		local n_path_components = #path_components
		if idx == n_path_components or idx < 3 then
			abbrivated_path[idx] = node
		elseif n_path_components < 3 then
			abbrivated_path[idx] = node
		else
			abbrivated_path[idx] = node:sub(1,1) == '.' and node:sub(1, 2) or node:sub(1, 1)
		end
	end
	return table.concat(abbrivated_path, "/")
end
require("lualine").setup({
	options = {
		icons_enabled = false,
		theme = "tokyonight", -- "tokyonight",-- "catppuccin", --palenight is tight
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = { "deck" },
			winbar = { "help", "Trouble", "NvimTree", "Outline", "packer", "qf", "toggleterm", "deck" },
		},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { { mypwd}  },
		lualine_c = { "branch", "diff" },
		lualine_x = { "diagnostics" },
		lualine_y = {
			{
				"aerial",
				-- The separator to be used to separate symbols in status line.
				sep = " ) ",

				-- The number of symbols to render top-down. In order to render only 'N' last
				-- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
				-- be used in order to render only current symbol.
				depth = -1,

				-- When 'dense' mode is on, icons are not rendered near their symbols. Only
				-- a single icon that represents the kind of current symbol is rendered at
				-- the beginning of status line.
				dense = false,

				-- The separator to be used to separate symbols in dense mode.
				dense_sep = ".",

				-- Color the symbol icons.
				colored = true,
			},
		},
		lualine_z = { "progress", "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {
		lualine_a = {
			{
				"buffers",
				icons_enabled = false,
				show_filename_only = true,
				hide_filename_extension = true,
				mode = 4,
				max_length = get_max_length,
				symbols = {
					modified = " ",
					alternate_file = " ",
					directory = "",
				},
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {
			{
				"filetype",
				colored = false, -- Displays filetype icon in color if set to true
				icon_only = false, -- Display only an icon for filetype
				-- icon = { align = "right" }, -- Display filetype icon on the right hand side
				-- icon =    {'X', align='right'}
				-- Icon string ^ in table is ignored in filetype component
			},
		},
		lualine_y = {},
		lualine_z = { "tabs" },
	},
	inactive_winbar = {
		lualine_c = {
			{
				_G.als_winbar,
				color = { bg = "NONE" },
			},
		},
	},

	extensions = { "aerial" },
})
