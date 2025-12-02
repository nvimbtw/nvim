return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	init = function()
		vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#89b4fa" })
		vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#b4befe" })
		vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#b4befe" })
		vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#94e2d5", bold = true })
	end,
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
					{
						icon = " ",
						key = "f",
						desc = "Search Files",
						action = ":TvFiles",
					},
					{
						icon = " ",
						key = "g",
						desc = "Search Text",
						action = ":TvText",
					},
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = ":Lazy",
					},
					{
						icon = "󰟾 ",
						key = "m",
						desc = "Mason",
						action = ":Mason",
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},

				header = [[
   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝


────────────────────────────────────────────────────────────
]],
			},

			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
			},
		},

		picker = { enabled = true },
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
