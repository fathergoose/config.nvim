local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }

	-- Completion
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Commands
	vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
	vim.cmd("command! LspFormatting lua vim.lsp.buf.format()")
	vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
	vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
	vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
	vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
	vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
	vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
	vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
	vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
	vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
	vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<space>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>.", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	--[[ local function organize_imports()
		local params = {
			command = "pyright.organizeimports",
			arguments = { vim.uri_from_bufnr(0) },
		}
		vim.lsp.buf.execute_command(params)
	end

	if client.name == "pyright" then
		vim.api.nvim_create_user_command("PyrightOrganizeImports", organize_imports, { desc = "Organize Imports" })
	end ]]
end

require("lspconfig").tsserver.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = on_attach,
	init_options = {
		hostInfo = "neovim",
	},
})

local null_ls = require("null-ls")

null_ls.setup({
	on_attach = on_attach,
	debug = true,
	sources = {
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.formatting.stylua.with({
			filetypes = {
				"lua",
			},
		}),
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.completion.spell.with({
			filetypes = {
				"txt",
				"markdown",
			},
		}),
		null_ls.builtins.formatting.prettierd.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
		}),
		null_ls.builtins.formatting.prettier.with({
			"json",
			"yaml",
			"toml",
			"graphql",
			"markdown",
			"css",
			"scss",
			"less",
			"json5",
			"jsonc",
			"vue",
			"svelte",
		}),
		null_ls.builtins.diagnostics.cfn_lint,
		null_ls.builtins.diagnostics.codespell,
		null_ls.builtins.formatting.codespell.with({
			filetypes = { "markdown", "text" },
		}),
		null_ls.builtins.formatting.sqlfluff.with({
			extra_args = { "--dialect", "postgres", "--exclude-rules", "L031" },
		}),
        null_ls.builtins.code_actions.refactoring,
		null_ls.builtins.formatting.beautysh,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.diagnostics.luacheck.with({
			filetypes = {
				"lua",
			},
			args = {
				"--formatter",
				"plain",
				"--codes",
				"--ranges",
				"--filename",
				"/Users/al/.config/nvim/init.lua",
				"-",
				"--globals",
				"vim",
			},
		}),
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.diagnostics.flake8,
	},
})
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = {
		severity_limit = "Hint",
	},
	virtual_text = {
		severity_limit = "Warning",
	},
})

require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	ignore_install = { "phpdoc", "tree-sitter-phpdoc" },
	highlight = {
		enabled = true,
		additional_vim_regex_highlighting = false,
	},
})

vim.diagnostic.config({
	virtual_text = { severity = { min = vim.diagnostic.severity.WARN } },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },
})

--[[ require("lspconfig").pyright.setup({
	on_attach = on_attach,
	python = {
		analysis = {
			autoSearchPaths = true,
			diagnosticMode = "file",
			useLibraryCodeForTypes = true,
		},
	},
}) ]]

require("lspconfig").pylyzer.setup({
    on_attach = on_attach,
})
