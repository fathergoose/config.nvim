local custom_solarized = require("lualine.themes.solarized")
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

local function getCWD()
	local path = vim.fn.getcwd()
	local home = vim.fn.expand("$HOME")
	return path:gsub(home, "~")
end
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = custom_solarized, --palenight is tight
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = { "help", "Trouble", "NvimTree", "Outline", "packer", "qf", "toggleterm" },
		},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { getCWD },
		lualine_c = { "branch", "diff" },
		lualine_x = { "diagnostics" },
		lualine_y = {},
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
				icons_enabled = true,
				show_filename_only = true,
				hide_filename_extension = true,
				mode = 4,
				max_length = get_max_length,
                symbols = {
                    modified = " ",
                    alternate_file = " ",
                    directory = "",
                }
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {
			{
				"filetype",
				colored = false, -- Displays filetype icon in color if set to true
				icon_only = false, -- Display only an icon for filetype
				icon = { align = "right" }, -- Display filetype icon on the right hand side
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

	extensions = {},
})
