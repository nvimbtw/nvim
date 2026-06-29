return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	config = function(_, opts)
		require("snacks").setup(opts)
	end,
	init = function() end,
	---@type snacks.Config
	opts = {
		dashboard = {
			enabled = true,
			width = 60,
			row = nil,
			col = nil,
			pane_gap = 4,
			autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",

			preset = {
				keys = {
					{ key = "f", desc = "Search Files", action = ":Tv files" },
					{ key = "g", desc = "Search Text",  action = ":Tv text" },
					{ key = "l", desc = "Lazy",         action = ":Lazy" },
					{ key = "m", desc = "Mason",        action = ":Mason" },
					{ key = "v", desc = "LazyGit",      action = ":LazyGit" },
					{ key = "q", desc = "Quit",         action = ":qa" },
				},

				header = "N E O V I M",
			},

			formats = {
				key = function(item)
					return {
						{ item.key, hl = "SnacksDashboardKey" },
						{ "   ",    hl = "SnacksDashboardKey" },
					}
				end,
			},

			sections = {
				{ section = "header", padding = 2 },
				{ text = { { "───────────", hl = "SnacksDashboardFooter" } }, align = "center", padding = 2 },
				{ section = "keys", gap = 1, padding = 2 },
				{ section = "startup" },
			},
		},

		picker = {
			enabled = true,
			sources = {
				explorer = {
					-- match herdr's sidebar_width = 26 (snacks default is 40)
					layout = {
						preset = "sidebar",
						layout = { width = 26, min_width = 26 },
					},
				},
			},
		},
		notifier = { enabled = true },
		indent = { enabled = true },
		explorer = {
			enabled = true,
		},
		bigfile = { enabled = false },
		input = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
	},
	keys = {
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
	},
}
