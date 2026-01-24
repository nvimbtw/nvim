return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("harpoon").setup()
	end,
	keys = {
		{
			"<leader>hm",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Harpoon: mark file",
		},
		{
			"<leader>ha",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Harpoon: toggle quick menu",
		},
		{
			"<leader>hn",
			function()
				require("harpoon.ui").nav_next()
			end,
			desc = "Harpoon: go to next mark",
		},
		{
			"<leader>hp",
			function()
				require("harpoon.ui").nav_prev()
			end,
			desc = "Harpoon: go to previous mark",
		},
		-- jump directly to slot #1–4
		{
			"<leader>h1",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			desc = "Harpoon: jump to file 1",
		},
		{
			"<leader>h2",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			desc = "Harpoon: jump to file 2",
		},
		{
			"<leader>h3",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			desc = "Harpoon: jump to file 3",
		},
		{
			"<leader>h4",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			desc = "Harpoon: jump to file 4",
		},
		{
			"<leader>hr",
			function()
				local mark = require("harpoon.mark")
				local config = require("harpoon").get_mark_config()
				local ui = require("harpoon.cmd-ui")

				local idx = mark.get_current_index()
				if idx then
					table.remove(config.marks, idx)
					ui.toggle_quick_menu()
				end
			end,
			desc = "Harpoon: remove current file mark",
		},
	},
}
