return {
	"rachartier/tiny-glimmer.nvim",
	event = "VeryLazy",
	priority = 10,
	config = function()
		require("configs.tiny-glimmer")
	end,
}
