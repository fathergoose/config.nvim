local cmp = require("cmp")
local lspkind = require("lspkind")

vim.cmd("set completeopt=menuone,noselect")
cmp.setup({
	enabled = function()
		return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
	end,
    preselect = cmp.PreselectMode.Item,
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				-- latex_symbols = "[Latex]",
			},
		}),
	},
	completion = {
		completeopt = "menu,menuone,noselect",
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.mapping(cmp.mapping.confirm({ select = true }))
			else
				fallback()
			end
		end, { "i" }),
		["<C-e>"] = cmp.mapping.abort(),
		["<tab>"] = cmp.mapping(function(fallback)
			if require("copilot.suggestion").is_visible() then
				require("copilot.suggestion").accept()
			else
				fallback()
			end
		end),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lsp" },
		-- { name = "vsnip" }, -- For vsnip users.
		{ name = "luasnip" }, -- For luasnip users.
		{ name = "nvim_lua" },
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
	sources = {
		{ name = "dap" },
	},
})
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--[[ cmp.setup.cmdline(":", {
	preselect = cmp.PreselectMode.Item,
	mapping = cmp.mapping.preset.cmdline({
		["<C-e>"] = cmp.mapping.complete(),
		["<C-y>"] = cmp.mapping.complete({
			select = true,
		}),
		["<C-u>"] = cmp.mapping.scroll_docs(4),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),

		["<C-p>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.mapping(cmp.mapping.select_prev_item())
			else
				fallback()
			end
		end),
		["<C-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.mapping(cmp.mapping.select_next_item())
			else
				fallback()
			end
		end),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.mapping(cmp.mapping.select_next_item())
			else
				fallback()
			end
		end),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.mapping(cmp.mapping.select_prev_item())
			else
				fallback()
			end
		end),
	}),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	completion = {
		autocomplete = true,
	},
}) ]]

vim.cmd([[
set pumheight=10
]])

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

require("lspconfig")["rust_analyzer"].setup({
	capabilities = capabilities,
})
