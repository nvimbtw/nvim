-- Kanagawa Dragon palette (warm editorial accents)
local colors = {
	aqua     = "#8ea4a2",
	teal     = "#949fb5",
	teal_alt = "#343840",
	red      = "#c4746e",
	sand     = "#c4b28a",
	orange   = "#b6927b",
	green    = "#87a987",
	bg       = "#181616",
	bg_alt   = "#282727",
	fg       = "#c5c9c5",
	muted    = "#393836",
}

-- Cursor Types per Mode
vim.opt.guicursor = {
	"n:block-CursorNormal",
	"i-ci:ver25-CursorInsert",
	"v-V:block-CursorVisual",
	"c:block-CursorCommand",
	"o:hor50",
}

-- Line Number Highlights
local mode_colors = {
	n  = colors.aqua,
	i  = colors.sand,
	v  = colors.teal,
	V  = colors.teal,
	c  = colors.green,
	no = colors.sand,
}

vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = "*",
	callback = function()
		local mode = vim.fn.mode()
		local color = mode_colors[mode] or colors.fg
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = color })
	end,
})

vim.api.nvim_set_hl(0, "LineNr", { fg = colors.muted })

-- Cursor Highlights
vim.api.nvim_set_hl(0, "Visual", { bg = colors.teal_alt })
vim.api.nvim_set_hl(0, "CursorYank", { bg = colors.sand })
vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.bg })
vim.api.nvim_set_hl(0, "CursorNormal", { bg = colors.aqua })
vim.api.nvim_set_hl(0, "CursorInsert", { bg = colors.sand })
vim.api.nvim_set_hl(0, "CursorVisual", { bg = colors.teal })
vim.api.nvim_set_hl(0, "CursorCommand", { bg = colors.green })

-- Agentic Highlights
vim.api.nvim_set_hl(0, "AgenticStatusCompleted", { bg = colors.bg_alt, fg = colors.aqua })
vim.api.nvim_set_hl(0, "AgenticStatusPending", { bg = colors.bg_alt, fg = colors.teal })
vim.api.nvim_set_hl(0, "AgenticTitle", { bg = colors.bg_alt, fg = colors.sand, bold = true })

-- Snacks Highlights
vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = colors.aqua })
vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = colors.fg })
vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = colors.sand })
vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = colors.aqua, bold = true })
vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = colors.bg_alt })
vim.api.nvim_set_hl(0, "SnacksDashboardTitle", { fg = colors.sand, bold = true })
vim.api.nvim_set_hl(0, "SnacksDashboardLabel", { fg = colors.muted })
vim.api.nvim_set_hl(0, "SnacksDashboardGitBranch", { fg = colors.green, bold = true })

-- Diagnostic Highlights
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.sand })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.aqua })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.teal })

-- Virtual Text Highlights
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = colors.red, bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = colors.sand, bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = colors.aqua, bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = colors.teal, bg = "none" })

-- Underline Highlights
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.sand })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.aqua })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.teal })

-- Blink Highlights
vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg = colors.fg, bg = colors.bg_alt })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = colors.muted, bg = colors.bg_alt })
vim.api.nvim_set_hl(0, "BlinkCmpItem", { fg = colors.fg, bg = colors.bg_alt })
vim.api.nvim_set_hl(0, "BlinkCmpItemAbbr", { fg = colors.fg })
vim.api.nvim_set_hl(0, "BlinkCmpItemAbbrMatch", { fg = colors.sand, bold = true })
vim.api.nvim_set_hl(0, "BlinkCmpItemAbbrMatchFuzzy", { fg = colors.sand })
vim.api.nvim_set_hl(0, "BlinkCmpItemKind", { fg = colors.aqua })
vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = colors.fg, bg = colors.bg_alt })
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = colors.muted, bg = colors.bg_alt })
vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { fg = colors.muted })
vim.api.nvim_set_hl(0, "BlinkCmpScrollBarThumb", { bg = colors.muted })
vim.api.nvim_set_hl(0, "BlinkCmpScrollBarGutter", { bg = colors.bg_alt })
vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = colors.fg })
vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = colors.sand, bold = true })
vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = colors.aqua })
