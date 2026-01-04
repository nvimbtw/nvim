require("tv").setup({
	keybindings = {
		files = "<leader>ff", -- or false to disable
		text = "<leader>fg",
		channels = "<leader>tv", -- channel selector
	},
	quickfix = {
		auto_open = true,
	},
	window = {
		width = 0.95,
		height = 0.95,
		border = "none", -- none|single|double|rounded|solid|shadow
		title = "   Television ",
	},
	files = {
		args = { "--preview-size", "70", "--source-command", "fd -t f --hidden --no-ignore ." },
	},
	text = {
		args = { "--preview-size", "70" },
	},
})
