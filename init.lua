vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy_setup")
require("settings")
require("highlights")

vim.defer_fn(function()
	require("snacks").explorer()
end, 0)

vim.diagnostic.config({
	virtual_text = true, -- Disable inline text to prevent overflow
	signs = true, -- Keep the sign column icons (E, W, etc.)
	underline = true, -- Optional: Keep squiggly underlines under errors
	update_in_insert = false, -- Avoid jittery updates while typing
	severity_sort = true, -- Sort diagnostics by severity in floats

	float = {
		focused = false, -- Don't steal focus when opening
		style = "minimal", -- Clean look (or "other" for shadow)
		border = "rounded", -- Pretty rounded borders
		source = "if_many", -- Show LSP source only if multiple
		header = "", -- No header
		prefix = "", -- No prefix
		wrap = true, -- Enable line wrapping (default, but explicit for clarity)
		max_height = 20, -- Limit height to avoid huge floats
		max_width = 0.8, -- 80% of screen width max
		win_options = { -- Extra float tweaks
			wrap = true, -- Reinforce wrapping
			linebreak = true, -- Break at word boundaries
		},
	},
})

vim.opt.shell = "nu"
