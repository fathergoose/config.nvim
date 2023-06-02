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
		use({
			"mzarnitsa/psql",
			opt = true,
			config = function()
				require("psql").setup({
					database_name = "warehouse",
					user = "postgres",
					host = "127.0.0.1",
					port = 5432,
				})
			end,
		})
		use({ "tpope/vim-fugitive" })
		use({ "tpope/vim-rhubarb" })
		use({ "tpope/vim-surround" })
		use({ "tpope/vim-repeat" })
		use({ "nvim-lua/plenary.nvim" })
		use({ "MunifTanjim/nui.nvim" })
		use({ "fladson/vim-kitty" })
		use({ "neovim/nvim-lspconfig" })
		use({ "jose-elias-alvarez/null-ls.nvim" })
		use({ "folke/trouble.nvim" })
		use({ "ray-x/guihua.lua", run = "cd lua/fzy && make" })
		require("guihua.maps").setup({
			maps = {
				close_view = "<C-x>",
			},
		})
		use({ "nvim-telescope/telescope.nvim" })
		use({ "dstein64/vim-startuptime" })
		use({ "lewis6991/impatient.nvim" })
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		use("dhruvasagar/vim-table-mode")
		use({ "SidOfc/mkdx" })
		use("rhysd/vim-gfm-syntax")
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
		use("hrsh7th/cmp-nvim-lsp-signature-help")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-emoji")
		use("hrsh7th/cmp-cmdline")
		use("hrsh7th/nvim-cmp")
		use("rcarriga/cmp-dap")
		use("L3MON4D3/LuaSnip")
		use("saadparwaiz1/cmp_luasnip")
		use({
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			event = { "InsertEnter" },
			config = function()
				vim.defer_fn(function()
					require("copilot").setup({
						panel = {
							enabled = true,
							auto_refresh = false,
							keymap = {
								jump_prev = "[[",
								jump_next = "]]",
								accept = "<CR>",
								refresh = "gr",
								open = "<M-CR>",
							},
							layout = {
								position = "bottom", -- | top | left | right
								ratio = 0.4,
							},
						},
						cmp = {
							enabled = true,
							method = "getCompletionsCycling",
						},

						filetypes = {
							markdown = false,
							vimwiki = false,
							json = false,
							Telescope = false,
							rust = false,
							["*"] = true,
						},
						suggestion = {
							enabled = true,
							auto_trigger = true,
							debounce = 75,
							keymap = {
								accept = "<M-l>",
								accept_word = false,
								accept_line = false,
								next = "<M-]>",
								prev = "<M-[>",
								dismiss = "<C-]>",
							},
						},
						server_opts_overrides = {
							--[[ trace = "verbose",
							settings = {
								advanced = {
									listCount = 10, -- #completions for panel
									inlineSuggestCount = 3, -- #completions for getCompletions
								},
							}, ]]
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
		use("folke/lua-dev.nvim")
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
		-- use("simrat39/symbols-outline.nvim")
		use("ethanholz/nvim-lastplace")
		use("rcarriga/nvim-notify")
		use("nvim-treesitter/nvim-treesitter-context")
		use("MaxMEllon/vim-jsx-pretty")
		use("tpope/vim-eunuch")
		use({
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		use("norcalli/nvim-colorizer.lua")
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
			opt = true,
			cmd = "GitConflictListQf",
		})
		use({ "kevinhwang91/rnvimr", opt = true, cmd = "RnvimrToggle" })
		use("simrat39/rust-tools.nvim")
		use("darfink/vim-plist")
		use({
			"nvim-tree/nvim-tree.lua",
			requires = {
				"nvim-tree/nvim-web-devicons", -- optional, for file icons
			},
			tag = "nightly", -- optional, updated every week. (see issue #1193)
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				vim.cmd("highlight IndentBlanklineChar guifg=#222222 gui=nocombine")

				require("indent_blankline").setup({
					-- char = "▏",
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
			"fathergoose/neonews",
			-- "/Users/al/code/nvim/neonews/",
			config = function()
				require("neonews").setup({
					check_on_startup = false,
					unread_news_strategy = "sha256",
					startup_message = false,
				})
			end,
		})
		use("hrsh7th/cmp-nvim-lua")
		use({
			"catppuccin/nvim",
			as = "catppuccin",
		})
		use({
			"windwp/nvim-autopairs",
			config = function()
				local Rule = require("nvim-autopairs.rule")
				require("nvim-autopairs").setup({
					ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
					check_ts = true,
					ts_config = {
						lua = { "string" }, -- it will not add a pair on that treesitter node
						javascript = { "template_string" },
						java = false, -- don't check treesitter on java
					},
				})
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				local cmp = require("cmp")
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
				local npairs = require("nvim-autopairs")

				local ts_conds = require("nvim-autopairs.ts-conds")

				-- press % => %% only while inside a comment or string
				npairs.add_rules({
					Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
					Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
				})
			end,
		})
		use({ "vim-scripts/dbext.vim", opt = true, ft = { "sql" } })
		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup({
					signs = false,
				})
			end,
		})
		use({
			"iamcco/markdown-preview.nvim",
			run = "cd app && npm install",
			setup = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		})
		use("epwalsh/obsidian.nvim")
		-- Packer
		use({
			"jackMort/ChatGPT.nvim",
			requires = {
				"MunifTanjim/nui.nvim",
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope.nvim",
			},
		})
		use({
			"ahmedkhalf/project.nvim",
		})
		use({
			"stevearc/aerial.nvim",
		})
		use("mfussenegger/nvim-dap")
		use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
		use("folke/neodev.nvim")
		use({
			"mrjones2014/legendary.nvim",
			requires = "kkharji/sqlite.lua",
		})
		use({ "stevearc/dressing.nvim" })
		use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
		use("folke/lsp-colors.nvim")
		use("folke/tokyonight.nvim")
		use({
			"lalitmee/cobalt2.nvim",
			requires = "tjdevries/colorbuddy.nvim",
		})
		use("olimorris/onedarkpro.nvim")
		use("tiagovla/tokyodark.nvim")
		use("ishan9299/nvim-solarized-lua")
		use("xiyaowong/nvim-transparent")
		use({
			"Hrle97/nvim.diagnostic_virtual_text_config",
			config = function()
				require("nvim.diagnostic_virtual_text_config").setup({
					-- your config here...
				})
			end,
		})
		use("nvim-neotest/neotest-python")
		use({
			"nvim-neotest/neotest",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-treesitter/nvim-treesitter",
				"antoinemadec/FixCursorHold.nvim",
			},
		})
	end,

	config = { display = { open_cmd = "rightbelow 75vnew \\[packer\\]" }, max_jobs = 10 },
})
