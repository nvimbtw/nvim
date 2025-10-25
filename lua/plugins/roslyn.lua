return {
	"seblyng/roslyn.nvim",
	ft = { "cs", "csx", "cake" },
	dependencies = { "neovim/nvim-lspconfig" },
	opts = {
		filewatching = "auto",
		broad_search = false,
		lock_target = false,
		silent = false,
	},
	config = function(_, opts)
		require("roslyn").setup(opts)
		vim.lsp.config("roslyn", {
			-- Simple cmd: csharp-ls binary (no DLL needed)
			cmd = { "csharp-ls" },
			capabilities = _G.lsp_capabilities,
			single_file_support = true,
			settings = {
				["csharp|background_analysis"] = {
					background_analysis_dotnet_analyzer_diagnostics_scope = "fullSolution",
				},
				["csharp|code_lens"] = { dotnet_enable_references_code_lens = true },
				["csharp|inlay_hints"] = {
					csharp_enable_inlay_hints_for_implicit_object_creation = true,
					csharp_enable_inlay_hints_for_implicit_variable_types = true,
				},
				["csharp|formatting"] = { dotnet_organize_imports_on_format = true },
			},
			on_attach = function(client, bufnr)
				client.server_capabilities.semanticTokensProvider = { full = true }
			end,
		})
	end,
}
