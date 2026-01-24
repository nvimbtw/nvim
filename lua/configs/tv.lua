require("tv").setup({
	tv_binary = "tv",
	global_keybindings = {
		channels = "<leader>tv",
	},
	quickfix = {
		auto_open = true,
	},
	window = {
		width = 0.90,
		height = 0.90,
		border = "none",
		title = "   Television ",
		title_pos = "center",
	},
	channels = {
		files = {
			keybinding = "<leader>ff",
		},
		text = {
			keybinding = "<leader>fg",
		},
	},
})
