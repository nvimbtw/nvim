require("conform").setup({
	notify_on_error = false,
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		-- web
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		html = { "prettierd" },
		css = { "prettierd" },
		-- other
		rust = { "rustfmt" },
		python = { "ruff_format" },
		lua = { "stylua" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		cs = { "csharpier" },
		zig = { "zigfmt" },
	},
})
