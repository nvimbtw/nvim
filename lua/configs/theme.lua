-- Kanagawa Dragon — warm, muted, editorial.
require("kanagawa").setup({
	compile = false,
	undercurl = true,
	commentStyle = { italic = true },
	functionStyle = { bold = true },
	keywordStyle = { italic = false },
	statementStyle = { bold = false },
	transparent = true,
	dimInactive = false,
	terminalColors = true,
	theme = "dragon",
	background = { dark = "dragon", light = "lotus" },
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
})

vim.opt.background = "dark"
vim.cmd("colorscheme kanagawa-dragon")

-- Kanagawa Dragon palette (warm editorial accents)
local colors = {
	bg = "#181616",
	bg_alt = "#282727",
	aqua = "#8ea4a2",
	sand = "#c4b28a",
	orange = "#b6927b",
	red = "#c4746e",
	green = "#87a987",
	teal = "#949fb5",
	fg = "#c5c9c5",
}

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.sand })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.aqua })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.teal })

-- Floating Windows
vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.bg })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.aqua, bg = colors.bg })
vim.api.nvim_set_hl(0, "DiagnosticNormal", { bg = colors.bg })
vim.api.nvim_set_hl(0, "DiagnosticBorder", { fg = colors.aqua, bg = colors.bg })
