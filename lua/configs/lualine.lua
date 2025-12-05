local colors = {
	mainNormal = "#89b4fa",
	mainInsert = "#cdd6f4",
	mainVisual = "#b4befe",
	mainCommand = "#94e2d5",
	font = "#1e1e2e",
	background = "#313244",
	transparent = "#00000000",
}

local catppuccin = {
	normal = {
		a = { fg = colors.font, bg = colors.mainNormal, bold = true },
		b = { fg = colors.mainVisual, bg = colors.transparent, bold = true },
		y = { fg = colors.mainVisual, bg = colors.transparent, bold = true },
		z = { fg = colors.font, bg = colors.mainNormal, bold = true },
	},
	visual = {
		a = { fg = colors.font, bg = colors.mainVisual, bold = true },
		b = { fg = colors.mainVisual, bg = colors.transparent, bold = true },
		y = { fg = colors.mainVisual, bg = colors.transparent, bold = true },
		z = { fg = colors.font, bg = colors.mainVisual, bold = true },
	},
	command = {
		a = { fg = colors.font, bg = colors.mainCommand, bold = true },
		b = { fg = colors.mainVisual, bg = colors.transparent, bold = true },
		y = { fg = colors.mainVisual, bg = colors.transparent, bold = true },
		z = { fg = colors.font, bg = colors.mainCommand, bold = true },
	},
	insert = {
		a = { fg = colors.font, bg = colors.mainInsert, bold = true },
		b = { fg = colors.mainVisual, bg = colors.transparent, bold = true },
		y = { fg = colors.mainVisual, bg = colors.transparent, bold = true },
		z = { fg = colors.font, bg = colors.mainInsert, bold = true },
	},
	inactive = {
		a = { fg = colors.background, bg = colors.transparent, bold = true },
		z = { fg = colors.background, bg = colors.transparent, bold = true },
	},
}

require("lualine").setup({
	options = {
		theme = catppuccin,
		component_separators = "",
		-- section_separators = { left = "", right = "" },
		section_separators = { left = "󰇝", right = "󰇝" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "progress" },
	},
	tabline = {},
	extensions = {},
})
