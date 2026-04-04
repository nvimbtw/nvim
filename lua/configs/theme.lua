vim.opt.background = "dark"
vim.cmd("colorscheme oxocarbon")

-- Custom Highlights for Oxocarbon
local colors = {
	bg = "#161616",
	bg_alt = "#262626",
	cyan = "#3ddbd9",
	purple = "#be95ff",
	pink = "#ff7eb6",
	red = "#ee5396",
	green = "#42be65",
	fg = "#f2f4f8",
}

-- Ensure consistent diagnostic and UI colors
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.pink })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.purple })

-- Floating Windows
vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.bg })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.cyan, bg = colors.bg })
vim.api.nvim_set_hl(0, "DiagnosticNormal", { bg = colors.bg })
vim.api.nvim_set_hl(0, "DiagnosticBorder", { fg = colors.cyan, bg = colors.bg })
