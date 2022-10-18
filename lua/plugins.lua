-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

pcall(require, "impatient")

return require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")

		use("kyazdani42/nvim-web-devicons")

		use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })

		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

		use({
			"glacambre/firenvim",
			run = function()
				vim.fn["firenvim#install"](0)
			end,
		})

		use({
			"lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		})
		use({ "mzarnitsa/psql" })
		use({ "tpope/vim-fugitive" })
		use({ "tpope/vim-rhubarb" })
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
		use({ "SidOfc/mkdx", opt = true })
		use("rhysd/vim-gfm-syntax")
		use({ "vimwiki/vimwiki", opt = true, cmd = { "VimwikiIndex", "VimwikiMakeDiaryNote" }, branch = "dev" })
		use({
			"iamcco/markdown-preview.nvim",
			run = "cd app && npm install",
			setup = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		})

		use({
			"nvim-telescope/telescope-frecency.nvim",
			config = function()
				require("telescope").load_extension("frecency")
			end,
			requires = { "tami5/sqlite.lua" },
		})
		use({
		"nvim-telescope/telescope-smart-history.nvim",
			requires = { "tami5/sqlite.lua" },
		})
        
		use("b3nj5m1n/kommentary")
		use("numToStr/Comment.nvim")
		use("nvim-telescope/telescope-fzy-native.nvim")
		use("cappyzawa/trim.nvim")
		use("folke/which-key.nvim")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/vim-vsnip")
		use("L3MON4D3/LuaSnip")
		use("saadparwaiz1/cmp_luasnip")
		--use("github/copilot.vim")
		--[[ use({
			"zbirenbaum/copilot-cmp",
			after = { "copilot.lua" },
			config = function()
				require("copilot_cmp").setup()
			end,
		}) ]]
		use({
			"zbirenbaum/copilot.lua",
			event = { "VimEnter" },
			config = function()
				vim.defer_fn(function()
					require("copilot").setup({
						ft_disable = { "markdown", "vimwiki", "json", "Telescope", "rust" },
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
						suggestion = {
                            auto_trigger = true,
							keymap = {
								accept = "<TAB>", -- TODO: Change to vanilla imap for <tab> this is preventing me from using <tab> in insert
                                toggle_auto_trigger = "<C-Space>",
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
		use("karb94/neoscroll.nvim")
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
					exclude_dirs = { "~/Code/Augintel/apis/*" },
				})
			end,
		}) -- default configuration
		use({
			"RRethy/vim-illuminate",
			config = function()
				require("illuminate").configure({})
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
		use({
			"SidOfc/carbon.nvim",
			config = function()
				require("carbon").setup({
					auto_open = false,
					always_reveal = true,
					bang = true,
				})
			end,
		})
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				vim.cmd("highlight IndentBlanklineChar guifg=#4d5a5e gui=nocombine")

				require("indent_blankline").setup({
					char = "▏",
					buftype_exclude = { "terminal" },
					filetype_exclude = { "help", "terminal", "dashboard", "packer", "alpha" },
					show_trailing_blankline_indent = false,
					show_first_indent_level = false,
					space_char_blankline = " ",
					show_current_context = true,
				})
			end,
		})
		use({
			"/Users/al/code/nvim/neonews",
			config = function()
				require("neonews").setup({})
			end,
		})
		use("hrsh7th/cmp-nvim-lua")
	end,

	config = { display = { open_cmd = "rightbelow 75vnew \\[packer\\]" }, max_jobs = 10 },
})
