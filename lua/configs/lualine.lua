-- Kanagawa Dragon — editorial minimal statusline.
-- No separators, no powerline chrome. Muted ink, the mode is the only accent
-- (and it shifts color per mode, matching the cursor colors).
local colors = {
	aqua = "#8ea4a2",
	sand = "#c4b28a",
	teal = "#949fb5",
	green = "#87a987",
	red = "#c4746e",
	base = "#181616",
	muted = "#625e5a",
	text = "#c5c9c5",
}

-- Each mode keeps the same quiet body; only the mode badge (a) takes the accent.
local function scheme(accent)
	return {
		a = { fg = accent, bg = colors.base, gui = "bold" },
		b = { fg = colors.text, bg = colors.base },
		c = { fg = colors.muted, bg = colors.base },
		x = { fg = colors.muted, bg = colors.base },
		y = { fg = colors.muted, bg = colors.base },
		z = { fg = colors.text, bg = colors.base },
	}
end

local kanagawa = {
	normal = scheme(colors.aqua),
	insert = scheme(colors.sand),
	visual = scheme(colors.teal),
	command = scheme(colors.green),
	replace = scheme(colors.red),
	inactive = {
		a = { fg = colors.muted, bg = colors.base },
		b = { fg = colors.muted, bg = colors.base },
		c = { fg = colors.muted, bg = colors.base },
		x = { fg = colors.muted, bg = colors.base },
		y = { fg = colors.muted, bg = colors.base },
		z = { fg = colors.muted, bg = colors.base },
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
	return "󰒋 " .. table.concat(c, " ")
end

-- Neovim's native tabline is top-only and can't be relocated. Hide it and render
-- tab pages in the bottom (global) statusline instead — see lualine_z below.
vim.o.showtabline = 0

require("lualine").setup({
	options = {
		theme = kanagawa,
		component_separators = "",
		section_separators = "",
		globalstatus = true,
	},
	sections = {
		lualine_a = { { "mode", fmt = function(s) return s:lower() end } },
		lualine_b = { "branch" },
		lualine_c = { "diagnostics" },
		lualine_x = { "diff" },
		lualine_y = { clients_lsp },
		lualine_z = {
			"filetype",
			{
				"tabs",
				mode = 2, -- name + index; set to 1 for numbers only
				cond = function()
					return #vim.api.nvim_list_tabpages() > 1
				end,
				tabs_color = {
					active = { fg = colors.sand, bg = colors.base, gui = "bold" },
					inactive = { fg = colors.muted, bg = colors.base },
				},
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
