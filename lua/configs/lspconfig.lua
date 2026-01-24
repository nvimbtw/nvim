local capabilities = _G.lsp_capabilities
local lspconfig = require("lspconfig")

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

vim.lsp.config("clangd", {
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--background-index",
		"--query-driver=/run/current-system/sw/bin/gcc", -- ← this is the magic line
		"--query-driver=/run/current-system/sw/bin/clang", -- extra safety
	},
})
vim.lsp.enable("clangd")

vim.lsp.config("zls", {
	capabilities = capabilities,
	settings = {
		zls = {
			zig_exe_path = vim.fn.exepath("zig"),
			build_root = vim.loop.cwd(),
			enable_references = false,
		},
	},
})
vim.lsp.enable("zls")

vim.lsp.config("nixd", {
	capabilities = capabilities,
	settings = {
		nixd = {
			formatting = { command = "nixpkgs-fmt" },
			options = {
				enable = true,
				target = { nixos = true },
			},
			diagnostics = {
				enable = true,
			},
			semanticTokens = { enable = true },
		},
	},
})
vim.lsp.enable("nixd")

vim.lsp.config("tinymist", {
	settings = {
		formatterMode = "typstyle",
		exportPdf = "onSave",
		semanticTokens = "disable",
	},
})
vim.lsp.enable("tinymist")

-- vim.lsp.config("omnisharp", {
-- 	capabilities = capabilities,
-- 	filetypes = { "cs", "vb" },
-- 	root_markers = { "*.sln", "*.csproj", ".git" },
-- 	on_attach = function(client, bufnr)
-- 		if client.name == "omnisharp" then
-- 			vim.api.nvim_create_autocmd("BufWritePre", {
-- 				buffer = bufnr,
-- 				callback = function()
-- 					vim.lsp.buf.format({ async = false })
-- 				end,
-- 			})
-- 		end
-- 	end,
-- 	settings = {
-- 		FormattingOptions = {
-- 			EnableEditorConfigSupport = true,
-- 			InsertFinalNewLine = true,
-- 			OrganizeImports = true,
-- 			FormatOnType = true,
-- 		},
-- 		RoslynExtensionsOptions = {
-- 			EnableRoslynAnalyzers = true,
-- 			EnableEditorConfigSupport = true,
-- 			EnableImportCompletion = true,
-- 		},
-- 		Sdk = {
-- 			IncludePrereleases = true,
-- 		},
-- 	},
-- })
-- vim.lsp.enable("omnisharp")

vim.lsp.config("omnisharp", {
	capabilities = capabilities,
	filetypes = { "cs", "vb" },
	root_markers = { "*.sln", "*.csproj", ".git" },
	on_attach = function(client, bufnr)
		if client.name == "omnisharp" then
			-- Fix semantic tokens for theme compatibility
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
	settings = {
		FormattingOptions = {
			EnableEditorConfigSupport = true,
			InsertFinalNewLine = true,
			OrganizeImports = true,
			FormatOnType = true,
		},
		RoslynExtensionsOptions = {
			EnableRoslynAnalyzers = true,
			EnableEditorConfigSupport = true,
			EnableImportCompletion = true,
		},
		Sdk = {
			IncludePrereleases = true,
		},
	},
})
vim.lsp.enable("omnisharp")

-- lspconfig.omnisharp.setup({
-- 	capabilities = capabilities,
-- 	cmd = { "OmniSharp" },
-- 	filetypes = { "cs", "vb" },
-- 	root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
-- 	settings = {
-- 		FormattingOptions = {
-- 			EnableEditorConfigSupport = true,
-- 			InsertFinalNewLine = true,
-- 			OrganizeImports = true,
-- 			FormatOnType = true,
-- 		},
-- 		RoslynExtensionsOptions = {
-- 			EnableRoslynAnalyzers = true,
-- 			EnableEditorConfigSupport = true,
-- 			EnableImportCompletion = true,
-- 		},
-- 		Sdk = {
-- 			IncludePrereleases = true,
-- 		},
-- 	},
-- 	on_attach = function(client, bufnr)
-- 		if client.name == "omnisharp" then
-- 			vim.api.nvim_create_autocmd("BufWritePre", {
-- 				buffer = bufnr,
-- 				callback = function()
-- 					vim.lsp.buf.format({ async = false })
-- 				end,
-- 			})
-- 		end
-- 	end,
-- })

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
