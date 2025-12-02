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
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#7d7d7d" })
	end,
})

vim.api.nvim_set_hl(0, "CursorNormal", { bg = "#89b4fa" })
vim.api.nvim_set_hl(0, "CursorInsert", { bg = "#cdd6f4" })
vim.api.nvim_set_hl(0, "CursorVisual", { bg = "#b4befe" })
vim.api.nvim_set_hl(0, "CursorCommand", { bg = "#94e2d5" })

vim.opt.guicursor = {
	"n:block-CursorNormal",
	"i-ci:block-CursorInsert",
	"v-V:block-CursorVisual",
	"c:block-CursorCommand",
}

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "CursorNormal", { bg = "#89b4fa" })
		vim.api.nvim_set_hl(0, "CursorInsert", { bg = "#cdd6f4" })
		vim.api.nvim_set_hl(0, "CursorVisual", { bg = "#1e1e2e" })
		vim.api.nvim_set_hl(0, "CursorCommand", { bg = "#94e2d5" })
	end,
})

vim.api.nvim_set_hl(0, "Visual", { fg = "#b4befe", bg = "#2d3040" })
