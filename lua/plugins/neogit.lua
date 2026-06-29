return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		-- Only one of these is needed.
		"sindrets/diffview.nvim", -- optional
		"esmuellert/codediff.nvim", -- optional

		-- For a custom log pager
		"m00qek/baleia.nvim", -- optional

		-- Only one of these is needed.
		"nvim-telescope/telescope.nvim", -- optional
		"ibhagwan/fzf-lua",        -- optional
		"nvim-mini/mini.pick",     -- optional
		"folke/snacks.nvim",       -- optional
	},
	cmd = "Neogit",
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
		{
			-- Commit graph (tree) of the current branch, opened directly.
			-- `:Neogit log` only opens the log popup menu; this fires the
			-- "current branch" action with --graph so it lands on the graph.
			"<leader>gL",
			function()
				require("neogit").setup({}) -- idempotent; ensures highlights/autocmds
				require("neogit").action("log", "log_current", { "--graph", "--decorate", "--color" })()
			end,
			desc = "Neogit log graph (current branch)",
		},
	}
}
