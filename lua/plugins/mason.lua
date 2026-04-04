return {
	{
		"mason-org/mason.nvim",
		opts = {
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
			ui = {
				border = "single",
				width = 0.6,
				height = 0.8,
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"clangd",
				"emmet_language_server",
				"gopls",
				"lua_ls",
				"omnisharp",
				"pyright",
				"rust_analyzer",
				"ts_ls",
				"zls",
			},
		},
	},
}
