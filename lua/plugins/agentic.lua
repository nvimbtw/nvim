return {
	"carlos-algms/agentic.nvim",

	opts = {
		provider = "gemini-acp",

		keymaps = {
			prompt = {
				paste_image = {
					{
						"<A-p>",
						mode = { "n", "i" },
					},
				},
			},
		},

		acp_providers = {
			["gemini-acp"] = {
				command = "gemini",
				-- args = { "--model", "gemini-2.5-flash" },
				-- env = {
				-- 	GEMINI_API_KEY = "AIzaSyCE-IGa5fGdO_1pb4rgBVSe9XyD8s-SrXE"
				-- }
			}
		},

		headers = {
			chat = {
				title = "󱚡 Agentic",
			},

			files = {
				title = " Files"
			},

			input = {
				title = "󰭹 Message"
			}
		},

		diff_preview = {
			enabled = true,
			layout = "inline",
			center_on_navigate_hunks = true,
		},
	},

	keys = {
		{
			"<leader>aa",
			function()
				require("agentic").toggle()
			end,
			mode = { "n", "v" },
			desc = "Toggle Agentic Chat",
		},
		{
			"<leader>ad",
			function()
				require("agentic").add_selection_or_file_to_context()
			end,
			mode = { "n", "v" },
			desc = "Add file or selection to Agentic to Context",
		},
		{
			"<leader>an",
			function()
				require("agentic").new_session()
			end,
			mode = { "n", "v" },
			desc = "New Agentic Session",
		},
		{
			"<leader>ar", -- ai Restore
			function()
				require("agentic").restore_session()
			end,
			desc = "Agentic Restore session",
			silent = true,
			mode = { "n", "v" },
		},
	},
}
