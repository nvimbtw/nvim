local colors = {
	mainNormal = "#89b4fa",
	mainNormalAlt = "#232e40",
	mainInsert = "#cdd6f4",
	mainVisual = "#b4befe",
	mainCommand = "#94e2d5",
	mainTerminal = "#cba6f7",
	background = "#1e1e2e",
	transparent = "#00000000",
}

local catppuccin = {
	normal = {
		a = { fg = colors.mainNormal, bg = colors.background, bold = true },
		c = { fg = colors.mainNormal, bg = colors.transparent },
		z = { fg = colors.mainNormal, bg = colors.background, bold = true },
	},
	visual = {
		a = { fg = colors.mainVisual, bg = colors.background, bold = true },
		c = { fg = colors.mainVisual, bg = colors.transparent },
		z = { fg = colors.mainVisual, bg = colors.background, bold = true },
	},
	command = {
		a = { fg = colors.mainCommand, bg = colors.background, bold = true },
		c = { fg = colors.mainCommand, bg = colors.transparent },
		z = { fg = colors.mainCommand, bg = colors.background, bold = true },
	},
	insert = {
		a = { fg = colors.mainInsert, bg = colors.background, bold = true },
		c = { fg = colors.mainInsert, bg = colors.transparent },
		z = { fg = colors.mainInsert, bg = colors.background, bold = true },
	},
	terminal = {
		a = { fg = colors.mainTerminal, bg = colors.background, bold = true },
		c = { fg = colors.mainTerminal, bg = colors.transparent },
		z = { fg = colors.mainTerminal, bg = colors.background, bold = true },
	},
	inactive = {
		a = { fg = colors.background, bg = colors.transparent, bold = true },
		b = { fg = colors.background, bg = colors.transparent, bold = true },
		c = { fg = colors.transparent, bg = colors.transparent },
		y = { fg = colors.background, bg = colors.transparent, bold = true },
		z = { fg = colors.background, bg = colors.transparent, bold = true },
	},
}

require("lualine").setup({
	options = {
		theme = catppuccin,
		component_separators = { left = "󰇝", right = "󰇝" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "filename" },
	},
	inactive_sections = {
		lualine_a = { "mode" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "filename" },
	},
	tabline = {},
	extensions = {},
})
