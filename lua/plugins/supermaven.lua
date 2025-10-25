return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup(require("configs.supermaven"))
	end,
}
