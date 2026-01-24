return {
	"carlos-algms/agentic.nvim",

	opts = {
		-- Available by default: "claude-acp" | "gemini-acp" | "codex-acp" | "opencode-acp" | "cursor-acp"
		provider = "gemini-acp",
		keymaps = {
			prompt = {
				paste_image = {
					{
						"<localleader>p",
						mode = { "n" },
					},
				},
			},
		},
	},

	-- these are just suggested keymaps; customize as desired
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
	},
}
