local capabilities = require("blink.cmp").get_lsp_capabilities()

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

vim.lsp.config("qmlls", {
	capabilities = capabilities,
	cmd = { "/usr/lib/qt6/bin/qmlls" },
	filetypes = { "qml", "qmljs" },
	root_markers = { ".git", "qmldir", "CMakeLists.txt" },
})
vim.lsp.enable("qmlls")

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

vim.lsp.config("tinymist", {
	settings = {
		formatterMode = "typstyle",
		exportPdf = "onSave",
		semanticTokens = "disable",
	},
})
vim.lsp.enable("tinymist")

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
	capabilities = vim.tbl_deep_extend("force", capabilities, {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	}),
	settings = {
		["rust-analyzer"] = {
			rustfmt = {
				extraArgs = { "--config", "max_width=50" },
				enableRangeFormatting = true,
			},
			check = {
				command = "check",
				allTargets = false,
			},
		},
	},
})
vim.lsp.enable("rust_analyzer")

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})
vim.lsp.enable("lua_ls")

vim.lsp.config("ts_ls", {
	filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
	capabilities = capabilities,
	single_file_support = true,
})
vim.lsp.enable("ts_ls")
