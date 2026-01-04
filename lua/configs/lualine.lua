local colors = {
	mainNormal = "#89b4fa",
	mainNormalAlt = "#232e40",
	mainInsert = "#cdd6f4",
	mainVisual = "#b4befe",
	mainCommand = "#94e2d5",
	mainTerminal = "#cba6f7",
	background = "#1e1e2e",
	green = "#a6e3a1",
	transparent = "#00000000",
}

local catppuccin = {
	normal = {
		a = { fg = colors.mainNormal, bg = colors.background, gui = "bold" },
		c = { fg = colors.mainNormal, bg = colors.transparent },
		z = { fg = colors.mainNormal, bg = colors.background, gui = "bold" },
	},
	visual = {
		a = { fg = colors.mainVisual, bg = colors.background, gui = "bold" },
		c = { fg = colors.mainVisual, bg = colors.transparent },
		z = { fg = colors.mainVisual, bg = colors.background, gui = "bold" },
	},
	command = {
		a = { fg = colors.mainCommand, bg = colors.background, gui = "bold" },
		c = { fg = colors.mainCommand, bg = colors.transparent },
		z = { fg = colors.mainCommand, bg = colors.background, gui = "bold" },
	},
	insert = {
		a = { fg = colors.mainInsert, bg = colors.background, gui = "bold" },
		c = { fg = colors.mainInsert, bg = colors.transparent },
		z = { fg = colors.mainInsert, bg = colors.background, gui = "bold" },
	},
	terminal = {
		a = { fg = colors.mainTerminal, bg = colors.background, gui = "bold" },
		c = { fg = colors.mainTerminal, bg = colors.transparent },
		z = { fg = colors.mainTerminal, bg = colors.background, gui = "bold" },
	},
	inactive = {
		a = { fg = colors.background, bg = colors.transparent, gui = "" },
		b = { fg = colors.background, bg = colors.transparent, gui = "" },
		c = { fg = colors.transparent, bg = colors.transparent },
		y = { fg = colors.background, bg = colors.transparent, gui = "" },
		z = { fg = colors.background, bg = colors.transparent, gui = "" },
	},
}

local function clients_lsp()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })
	if next(clients) == nil then
		return ""
	end

	local c = {}
	for _, client in pairs(clients) do
		table.insert(c, client.name)
	end
	return "\u{f085} " .. table.concat(c, "|")
end

require("lualine").setup({
	options = {
		theme = catppuccin,
		component_separators = { left = "󰇝", right = "󰇝" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode", "branch", "diagnostics" },
		lualine_b = {},
		lualine_c = {
			{ "%=", separator = "", padding = { left = 0, right = 0 } },
			{ clients_lsp, color = { fg = colors.green }, separator = "", padding = { left = 1, right = 1 } },
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "diff", "filetype" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "branch" },
		lualine_x = { "filetype" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
