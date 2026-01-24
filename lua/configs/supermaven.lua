return {
	keymaps = {
		accept_suggestion = "<C-y>",
		clear_suggestion = "<C-]>",
		accept_word = "<C-j>",
	},
	ignore_filetypes = { cpp = true },
	color = {
		suggestion_color = "#45475a",
		cterm = 244,
	},
	log_level = "info",
	disable_inline_completion = false,
	disable_keymaps = false,
	condition = function()
		return true
	end,
}
