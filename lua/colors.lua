--[[ local flavor = string.lower(os.getenv("CATPPUCCIN_FLAVOR") or "macchiato")
require("catppuccin").setup({
	transparent_background = true,
	flavour = flavor, -- mocha, macchiato, mocha, latte
	background = {
		light = "latte",
		dark = flavor,
	},
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.20,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		which_key = true,
		cmp = true,
		aerial = true,
		telescope = true,
		treesitter_context = true,
		gitgutter = true,
		lsp_trouble = true,
		symbols_outline = true,
		treesitter = true,
		nvimtree = true,
		notify = true,
		markdown = true,
		dap = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
	},
}) ]]
require("tokyonight").setup({
	colorscheme = "night",
	-- colorscheme = 'storm',
	-- colorscheme = 'day',
	-- your configuration comes here
	-- or leave it empty to use the default settings
	style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	light_style = "day", -- The theme is used when the background is set to light
	transparent = not vim.g.neovide, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
	sidebars = { "qf", "help", "vista_kind", "terminal", "packer" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	day_brightness = 0.6, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	dim_inactive = false, -- dims inactive windows
	lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	---@param colors ColorScheme
	on_colors = function(colors) end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	---@param highlights Highlights
	---@param colors ColorScheme
	on_highlights = function(highlights, colors)
		highlights.WinSeparator = { fg = colors.fg_gutter }
	end,
})
vim.cmd.colorscheme("tokyonight")

-- require('onedark').load();
--[[ require("onedarkpro").setup({
  options = {
    transparency = true
  }
})
vim.cmd.colorscheme("onedark")
 ]]
-- vim.cmd("colorscheme solarized")
-- vim.g.tokyodark_transparent_background = false
-- vim.g.tokyodark_enable_italic_comment = true
-- vim.g.tokyodark_enable_italic = true
-- vim.g.tokyodark_color_gamma = "1.0"
-- vim.cmd("colorscheme tokyodark")
