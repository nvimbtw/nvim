local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup({
	disable_filetype = { "TelescopePrompt", "vim" },
	enable_check_bracket_line = false,
})

vim.keymap.set("v", "<C-a>", function()
	require("nvim-autopairs.fast_wrap").characters_wrap()
end, { expr = true, silent = true, desc = "FastWrap" })

npairs.add_rules({
	Rule("$", "$", "typst"):with_move(function(opts)
		return opts.next_char == "$"
	end):with_cr(false),
	Rule("*", "*", "typst"):with_move(function(opts)
		return opts.next_char == "*"
	end):with_cr(false),
	Rule("_", "_", "typst"):with_move(function(opts)
		return opts.next_char == "_"
	end):with_cr(false),
})
