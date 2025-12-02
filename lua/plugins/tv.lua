return {
	"alexpasmantier/tv.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("configs.tv")
	end,
}
