local function full_mode()
	local mode_map = {
		["n"] = "  NORMAL",
		["no"] = "N-PENDING",
		["v"] = "  VISUAL",
		["V"] = "  V-LINE",
		[""] = "  V-BLOCK",
		["s"] = "SELECT",
		["S"] = "S-LINE",
		[""] = "S-BLOCK",
		["i"] = "󰛓  INSERT",
		["ic"] = "INSERT-COMPLETE",
		["ix"] = "INSERT-COMPLETE",
		["R"] = "REPLACE",
		["Rv"] = "V-REPLACE",
		["c"] = "  COMMAND",
		["cv"] = "VIM EX",
		["ce"] = "EX",
		["r"] = "PROMPT",
		["rm"] = "MORE",
		["r?"] = "CONFIRM",
		["!"] = "SHELL",
		["t"] = "  TERMINAL",
	}
	local mode_code = vim.api.nvim_get_mode().mode
	return mode_map[mode_code] or mode_code
end

local colors = {
	mainNormal = "#89b4fa",
	mainInsert = "#cdd6f4",
	mainVisual = "#b4befe",
	mainCommand = "#94e2d5",
	font = "#1e1e2e",
	background = "#1e1e2e",
}

local catppuccin = {
	normal = {
		a = { fg = colors.font, bg = colors.mainNormal, bold = true },
		b = { fg = colors.mainVisual, bg = colors.background, bold = true },
		c = { fg = colors.mainNormal, bg = colors.background, bold = true },
		x = { fg = colors.mainVisual, bg = colors.background, bold = true },
		y = { fg = colors.mainVisual, bg = colors.background, bold = true },
	},

	insert = { a = { fg = colors.font, bg = colors.mainInsert, bold = true } },
	visual = { a = { fg = colors.font, bg = colors.mainVisual, bold = true } },
	replace = { a = { fg = colors.font, bg = colors.mainVisual, bold = true } },
	command = { a = { fg = colors.font, bg = colors.mainCommand, bold = true } },

	inactive = {
		a = { fg = colors.mainNormal, bg = colors.font, bold = true },
		b = { fg = colors.mainVisual, bg = colors.font, bold = true },
		c = { fg = colors.mainNormal, bold = true },
	},
}

require("lualine").setup({
	options = {
		theme = catppuccin,
		component_separators = "",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { { separator = { right = "" }, full_mode, right_padding = 2 } },
		lualine_b = { "filename" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "progress" },
		lualine_z = { { separator = { left = "" }, "location" } },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})
