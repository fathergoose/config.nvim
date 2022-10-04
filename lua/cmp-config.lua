-- Set up nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
    enabled = function()
      -- disable completion in comments
      local context = require 'cmp.config.context'
      -- keep command mode completion enabled when cursor is in a comment
      if vim.api.nvim_get_mode().mode == 'c' then
        return true
      else
        return not context.in_treesitter_capture("comment") 
          and not context.in_syntax_group("Comment")
      end
    end,
	performance = {
		debounce = 150,
		throttle = 500,
	},
	view = {
		entries = "custom",
	},
	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. strings[1] .. " "
			kind.menu = "    (" .. strings[2] .. ")"

			return kind
		end,
	},

	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item()),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item()),
	}),
	experimental = {
		ghost_text = false, -- this feature conflict with copilot.vim's preview.
	},
	sources = cmp.config.sources({
		{ name = "copilot" },
	}, {
        { name = "nvim_lsp" }
    }, {
		{ name = "vsnip" },
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

cmp.setup.filetype("markdown", {
	enabled = false,
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--[[ cmp.setup.cmdline("/", {
	view = {
		entries = "custom",
	},
	sources = {
		{ name = "buffer" },
	},
}) ]]

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	view = {
		entries = "custom",
	},
	mapping = {
		["<C-p>"] = function(fallback)
			if cmp.visible() then
				cmp.mapping(cmp.mapping.select_prev_item())
			else
				fallback()
			end
		end,
		["<C-n>"] = function(fallback)
			if cmp.visible() then
				cmp.mapping(cmp.mapping.select_next_item())
			else
				fallback()
			end
		end,
	},
	sources = cmp.config.sources({
		{ name = "cmdline" },
	--[[ }, {
		{ name = "path" },
	}), ]] })
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require("lspconfig")["tsserver"].setup({
	capabilities = capabilities,
})
