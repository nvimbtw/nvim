require("conform").setup({
	notify_on_error = false,
	format_on_save = function(bufnr)
		local disable_filetypes = { sql = true }
		local lsp_format_opt
		if disable_filetypes[vim.bo[bufnr].filetype] then
			lsp_format_opt = "never"
		else
			lsp_format_opt = "fallback"
		end
		return {
			timeout_ms = 500,
			lsp_format = lsp_format_opt,
		}
	end,
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
		sql = { "sql_formatter" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		cs = { "csharpier" },
		zig = { "zigfmt" },
	},
	formatters = {
		sql_formatter = {
			command = "sql-formatter",
			args = { "--language", "mysql" },
			stdin = true,
		},
	},
})
