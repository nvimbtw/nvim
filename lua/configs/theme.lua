require("catppuccin").setup({
	flavour = "mocha",
	show_end_of_buffer = false,
	no_italic = false,
	no_bold = false,
	no_underline = false,
	styles = {
		comments = { "italic" },
		conditionals = { "bold", "italic" },
		loops = { "bold", "italic" },
		functions = { "bold", "italic" },
		keywords = {},
		strings = {},
		variables = { "bold" },
		numbers = {},
		booleans = {},
		properties = {},
		types = { "bold" },
		operators = {},
	},
	lsp_styles = {
		virtual_text = {
			errors = { "bold", "italic" },
			hints = { "italic" },
			warnings = { "bold", "italic" },
			information = { "italic" },
			ok = { "italic" },
		},
		underlines = {
			errors = { "strikethrough" },
			hints = { "underline" },
			warnings = { "undercurl" },
			information = { "underdouble" },
			ok = { "underline" },
		},
		inlay_hints = {
			background = true,
		},
	},
	integrations = {
		blink_cmp = {
			enabled = true,
			style = "solid",
		},
		snacks = {
			enabled = true,
			indent_scope_color = "lavender",
		},
	},
})

vim.cmd("colorscheme catppuccin")
