local colors = {
	cyan = "#3ddbd9",
	green = "#42be65",
	pink = "#ff7eb6",
	purple = "#be95ff",
	teal = "#08bdba",
	red = "#ee5396",
	base = "#161616",
	surface = "#161616", -- Matches Base00
	muted = "#525252", -- Base03
	text = "#f2f4f8",
	transparent = "#00000000",
}

local oxocarbon = {
	normal = {
		a = { fg = colors.cyan, bg = colors.base, gui = "bold" },
		b = { fg = colors.purple, bg = colors.base, gui = "bold" },
		c = { fg = colors.pink, bg = colors.base, gui = "bold" },
		x = { fg = colors.pink, bg = colors.base, gui = "bold" },
		y = { fg = colors.purple, bg = colors.base, gui = "bold" },
		z = { fg = colors.cyan, bg = colors.base, gui = "bold" },
	},
	insert = {
		a = { fg = colors.cyan, bg = colors.base, gui = "bold" },
		b = { fg = colors.purple, bg = colors.base, gui = "bold" },
		c = { fg = colors.pink, bg = colors.base, gui = "bold" },
		x = { fg = colors.pink, bg = colors.base, gui = "bold" },
		y = { fg = colors.purple, bg = colors.base, gui = "bold" },
		z = { fg = colors.cyan, bg = colors.base, gui = "bold" },
	},
	visual = {
		a = { fg = colors.cyan, bg = colors.base, gui = "bold" },
		b = { fg = colors.purple, bg = colors.base, gui = "bold" },
		c = { fg = colors.pink, bg = colors.base, gui = "bold" },
		x = { fg = colors.pink, bg = colors.base, gui = "bold" },
		y = { fg = colors.purple, bg = colors.base, gui = "bold" },
		z = { fg = colors.cyan, bg = colors.base, gui = "bold" },
	},
	command = {
		a = { fg = colors.cyan, bg = colors.base, gui = "bold" },
		b = { fg = colors.purple, bg = colors.base, gui = "bold" },
		c = { fg = colors.pink, bg = colors.base, gui = "bold" },
		x = { fg = colors.pink, bg = colors.base, gui = "bold" },
		y = { fg = colors.purple, bg = colors.base, gui = "bold" },
		z = { fg = colors.cyan, bg = colors.base, gui = "bold" },
	},
	replace = {
		a = { fg = colors.cyan, bg = colors.base, gui = "bold" },
		b = { fg = colors.purple, bg = colors.base, gui = "bold" },
		c = { fg = colors.pink, bg = colors.base, gui = "bold" },
		x = { fg = colors.pink, bg = colors.base, gui = "bold" },
		y = { fg = colors.purple, bg = colors.base, gui = "bold" },
		z = { fg = colors.cyan, bg = colors.base, gui = "bold" },
	},
	inactive = {
		a = { fg = colors.muted, bg = colors.base, gui = "bold" },
		b = { fg = colors.muted, bg = colors.base, gui = "bold" },
		c = { fg = colors.muted, bg = colors.base, gui = "bold" },
		x = { fg = colors.muted, bg = colors.base, gui = "bold" },
		y = { fg = colors.muted, bg = colors.base, gui = "bold" },
		z = { fg = colors.muted, bg = colors.base, gui = "bold" },
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
	return "󰒋 " .. table.concat(c, "|")
end

require("lualine").setup({
	options = {
		theme = oxocarbon,
		component_separators = { left = "󰇝", right = "󰇝" },
		section_separators = { left = "󰇝", right = "󰇝" },
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "", right = "󰇝" }, color = { fg = colors.cyan, gui = "bold" } } },
		lualine_b = { { "branch", separator = { left = "", right = "󰇝" }, color = { fg = colors.purple, gui = "bold" } } },
		lualine_c = { { "diagnostics", color = { fg = colors.pink, gui = "bold" } } },
		lualine_x = { { "diff", color = { fg = colors.pink, gui = "bold" } } },
		lualine_y = { { clients_lsp, separator = { left = "󰇝", right = "" }, color = { fg = colors.purple, gui = "bold" } } },
		lualine_z = { { "filetype", separator = { left = "󰇝", right = "" }, color = { fg = colors.cyan, gui = "bold" } } },
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
