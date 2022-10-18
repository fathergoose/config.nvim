-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

pcall(require, "impatient")

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("kyazdani42/nvim-web-devicons")

	-- Lazy loading:
	-- Load on specific commands
	use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })

	-- Post-install/update hook with neovim command
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- Post-install/update hook with call of vimscript function with argument
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	-- Use dependency and run lua function after load
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({ "mzarnitsa/psql" })
	use({ "tpope/vim-fugitive", opt = true, cmd = { "Git" } })
	use({ "tpope/vim-surround" })
	use({ "tpope/vim-repeat" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "MunifTanjim/nui.nvim" })
	use({ "fladson/vim-kitty" })
	use({ "neovim/nvim-lspconfig" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "jose-elias-alvarez/typescript.nvim" })
	use({ "folke/trouble.nvim" })
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use({ "ray-x/guihua.lua" })
	use({ "nvim-telescope/telescope.nvim" })
	use({ "dstein64/vim-startuptime" })
	use({ "folke/tokyonight.nvim" })
	use("nathom/filetype.nvim")
	use({ "lewis6991/impatient.nvim" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use("dhruvasagar/vim-table-mode")
	-- use("tpope/vim-markdown")
	-- Make available with :PackerLoad mkdx
	use({ "SidOfc/mkdx", opt = true })
	use("rhysd/vim-gfm-syntax")
	use({ "vimwiki/vimwiki", opt = true, cmd = { "VimwikiIndex", "VimwikiMakeDiaryNote" }, branch = "dev" })
	-- use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })
	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- use("~/code/nvim/demoplug")
	-- use("~/example-plugin")
	use({
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		requires = { "tami5/sqlite.lua" },
	})
	use("b3nj5m1n/kommentary")
	use("numToStr/Comment.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("cappyzawa/trim.nvim")
	use({ "folke/which-key.nvim" })

	-- Completion engine and sources
	use("hrsh7th/cmp-nvim-lsp")
	-- use("hrsh7th/cmp-buffer")
	-- use("hrsh7th/cmp-path")
	-- use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	-- use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("github/copilot.vim")
	use("zbirenbaum/copilot-cmp")
	use({
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				require("copilot").setup({
					ft_disable = { "markdown", "vimwiki", "json", "Telescope" },
					cmp = {
						enabled = true,
						method = "getCompletionsCycling",
					},
					server_opts_overrides = {
						trace = "verbose",
						settings = {
							advanced = {
								listCount = 10, -- #completions for panel
								inlineSuggestCount = 3, -- #completions for getCompletions
							},
						},
					},
				})
			end, 100)
		end,
	})
	use({ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" })
	use("vim-scripts/applescript.vim")
	use("onsails/lspkind.nvim")
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				persist_size = false,
			})
		end,
	})
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		tag = "v1.*",
		--[[ config = function()
			vim.cmd("colorscheme rose-pine")
		end, ]]
	})
	--use("psliwka/vim-smoothie")
	use("karb94/neoscroll.nvim")
	-- use("blindFS/vim-taskwarrior")
	use({ "lalitmee/cobalt2.nvim", requires = "tjdevries/colorbuddy.nvim" })

	use({
		"ziontee113/color-picker.nvim",
		config = function()
			require("color-picker")
		end,
	})
	use("ishan9299/nvim-solarized-lua")
	use("xiyaowong/nvim-transparent")
	use("folke/lua-dev.nvim")
	use("folke/lsp-colors.nvim")
	use("folke/zen-mode.nvim")
	use("folke/twilight.nvim")
	use({
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("persistence").setup()
		end,
	})
	use("simrat39/symbols-outline.nvim")
	use("ethanholz/nvim-lastplace")
	use("rcarriga/nvim-notify")
	use("nvim-treesitter/nvim-treesitter-context")
	use("MaxMEllon/vim-jsx-pretty")
	use("tpope/vim-eunuch")
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			local alpha = require("alpha")
			local startify = require("alpha.themes.startify")
			startify.nvim_web_devicons.enabled = true
			startify.section.top_buttons.val = {
				startify.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
				startify.button(
					"l",
					"  Restore last session",
					[[<cmd>lua require("persistence").load({ last = true })<cr>]]
				),
				startify.button(
					"d",
					"  Restore last session for CWD " .. vim.fn.getcwd():match("([^/]+)$"),
					[[<cmd>lua require("persistence").load()<cr>]]
				),
				startify.button("p", "  Select recent project", [[<cmd>Telescope projects<cr>]]),
			}
			startify.config.opts.margin = 20
			alpha.setup(startify.config)
		end,
	})
	use("metakirby5/codi.vim")
	use("norcalli/nvim-colorizer.lua")
	use({
        "ahmedkhalf/project.nvim",
		-- "/Users/al/local/lib/project.nvim",
		config = function()
			require("project_nvim").setup({
                exclude_dirs = {"~/Code/Augintel/apis/*"},
			})
		end,
	}) -- default configuration
	use({
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				-- providers: provider used to get references in the buffer, ordered by priority
				providers = {
					"lsp",
					"treesitter",
					"regex",
				},
				-- delay: delay in milliseconds
				delay = 100,
				-- filetype_overrides: filetype specific overrides.
				-- The keys are strings to represent the filetype while the values are tables that
				-- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
				filetype_overrides = {},
				-- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
				filetypes_denylist = {
					"dirvish",
					"fugitive",
				},
				-- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
				filetypes_allowlist = {},
				-- modes_denylist: modes to not illuminate, this overrides modes_allowlist
				modes_denylist = {},
				-- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
				modes_allowlist = {},
				-- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
				-- Only applies to the 'regex' provider
				-- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
				providers_regex_syntax_denylist = {},
				-- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
				-- Only applies to the 'regex' provider
				-- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
				providers_regex_syntax_allowlist = {},
				-- under_cursor: whether or not to illuminate under the cursor
				under_cursor = false,
				-- max_file_lines: max number of lines in a file to illuminate
				max_file_lines = nil,
			})
		end,
	})
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup({
				default_mappings = true, -- disable buffer local mapping created by this plugin
				disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
				highlights = { -- They must have background color, otherwise the default color will be used
					incoming = "DiffText",
					current = "DiffAdd",
				},
			})
		end,
	})
	use("kevinhwang91/rnvimr")
	use("simrat39/rust-tools.nvim")
	use("darfink/vim-plist")
end)
