local capabilities = _G.lsp_capabilities

vim.lsp.config("emmet_language_server", {
	filetypes = { "css", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
	init_options = {
		--- @type table<string, string>
		includeLanguages = {},
		--- @type string[]
		excludeLanguages = {},
		--- @type string[]
		extensionsPath = {},
		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
		preferences = {},
		--- @type boolean Defaults to `true`
		showAbbreviationSuggestions = true,
		--- @type "always" | "never" Defaults to `"always"`
		showExpandedAbbreviation = "always",
		--- @type boolean Defaults to `false`
		showSuggestionsAsSnippets = false,
		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
		syntaxProfiles = {},
		--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
		variables = {},
	},
})
vim.lsp.enable("emmet_language_server")

vim.lsp.config("tinymist", {
	settings = {
		formatterMode = "typstyle",
		exportPdf = "off",
		semanticTokens = "disable",
	},
})
vim.lsp.enable("tinymist")

vim.lsp.config("sqls", {
	capabilities = capabilities,
	settings = {
		sqls = {
			connections = {
				{
					driver = "mysql",
					dataSourceName = "root:tadyonnix@tcp(127.0.0.1:3306)/jadralec?tls=false",
				},
			},
		},
	},
})
vim.lsp.enable("sqls")

vim.lsp.config("pyright", {
	capabilities = capabilities,
})
vim.lsp.enable("pyright")

vim.lsp.config("gopls", {
	capabilities = capabilities,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
})
vim.lsp.enable("gopls")

vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			rustfmt = {
				enablerangeformatting = true,
			},
		},
	},
})
vim.lsp.enable("rust_analyzer")

vim.lsp.config("qmlls", {
	capabilities = capabilities,
})
vim.lsp.enable("qmlls")

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
})
vim.lsp.enable("lua_ls")

vim.lsp.config("ts_ls", {
	filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
	capabilities = capabilities,
	single_file_support = true,
})
vim.lsp.enable("ts_ls")
