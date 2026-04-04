local transparent_groups = {
	"Normal",
	"NormalFloat",
	"NormalNC",
	"CursorLine",
	"CursorLineNr",
	"LineNr",
	"StatusLine",
	"StatusLineNC",
	"ModeMsg",
	"MsgArea",
	"NvimTreeNormal",
	"NvimTreeEndOfBuffer",
	"TelescopeNormal",
	"NonText",
	"Folded",
	"EndOfBuffer",
	"VertSplit",
	"SignColumn",
	"NormalMode",
	"InsertMode",
	"VisualMode",
	"ReplaceMode",
	"CommandMode",
}

for _, group in ipairs(transparent_groups) do
	vim.api.nvim_set_hl(0, group, { bg = "none" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		for _, group in ipairs(transparent_groups) do
			vim.api.nvim_set_hl(0, group, { bg = "none" })
		end

		local colors = {
			cyan = "#3ddbd9",
			purple = "#be95ff",
			red = "#ee5396",
			pink = "#ff7eb6",
			bg = "#161616",
			bg_alt = "#262626",
            fg = "#f2f4f8",
		}

		-- Agentic Highlights
		vim.api.nvim_set_hl(0, "AgenticStatusCompleted", { bg = colors.bg_alt, fg = colors.cyan })
		vim.api.nvim_set_hl(0, "AgenticStatusPending", { bg = colors.bg_alt, fg = colors.purple })
		vim.api.nvim_set_hl(0, "AgenticTitle", { bg = colors.bg_alt, fg = colors.pink, bold = true })

		vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = colors.cyan })
		vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = colors.fg })
		vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = colors.purple })
		vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = colors.cyan, bold = true })
		vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = colors.bg_alt })
		vim.api.nvim_set_hl(0, "SnacksDashboardTitle", { fg = colors.pink, bold = true })
		vim.api.nvim_set_hl(0, "SnacksDashboardLabel", { fg = colors.bg_alt })
		vim.api.nvim_set_hl(0, "SnacksDashboardGitBranch", { fg = colors.green, bold = true })

        -- Diagnostic Highlights
		vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
		vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.pink })
		vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.cyan })
		vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.purple })

		-- Virtual Text Highlights
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = colors.red, bg = "none" })
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = colors.pink, bg = "none" })
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = colors.cyan, bg = "none" })
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = colors.purple, bg = "none" })

		-- Underline Highlights
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.pink })
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.cyan })
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.purple })
	end,
})

vim.api.nvim_set_hl(0, "CursorNormal", { bg = "#3ddbd9" })
vim.api.nvim_set_hl(0, "CursorInsert", { bg = "#ff7eb6" })
vim.api.nvim_set_hl(0, "CursorVisual", { bg = "#be95ff" })
vim.api.nvim_set_hl(0, "CursorCommand", { bg = "#08bdba" })

vim.opt.guicursor = {
	"n:block-CursorNormal",
	"i-ci:ver25-CursorInsert",
	"v-V:block-CursorVisual",
	"c:block-CursorCommand",
}

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = "#262626" })
		vim.api.nvim_set_hl(0, "SnacksDashboardTitle", { fg = "#ff7eb6", bold = true })
		vim.api.nvim_set_hl(0, "SnacksDashboardLabel", { fg = "#393939" })
		vim.api.nvim_set_hl(0, "SnacksDashboardGitBranch", { fg = "#42be65", bold = true })
		vim.api.nvim_set_hl(0, "CursorNormal", { bg = "#3ddbd9" })
		vim.api.nvim_set_hl(0, "CursorInsert", { bg = "#ff7eb6" })
		vim.api.nvim_set_hl(0, "CursorVisual", { bg = "#be95ff" })
		vim.api.nvim_set_hl(0, "CursorCommand", { bg = "#08bdba" })
	end,
})

vim.api.nvim_set_hl(0, "Visual", { fg = "#be95ff", bg = "#393939" })
