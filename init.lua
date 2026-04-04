vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_liststyle = 0 -- Extra: Prevent any style-based triggers

require("lazy_setup")
require("settings")
require("highlights")
require("dupes")

vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. ":" .. vim.env.PATH

vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = "●",
		-- Only show the first line of the message to keep it clean
		format = function(diagnostic)
			local message = diagnostic.message:gsub("\n", " ")
			if #message > 30 then
				return string.sub(message, 1, 30) .. "..."
			end
			return message
		end,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN]  = "󰀪 ",
			[vim.diagnostic.severity.HINT]  = "󰌶 ",
			[vim.diagnostic.severity.INFO]  = "󰋽 ",
		},
	},
	underline = true,      -- Optional: Keep squiggly underlines under errors
	update_in_insert = false, -- Avoid jittery updates while typing
	severity_sort = true,  -- Sort diagnostics by severity in floats

	float = {
		focused = false, -- Don't steal focus when opening
		style = "minimal", -- Clean look (or "other" for shadow)
		border = "rounded", -- Pretty rounded borders
		source = "if_many", -- Show LSP source only if multiple
		header = "",  -- No header
		prefix = "",  -- No prefix
		wrap = true,  -- Enable line wrapping (default, but explicit for clarity)
		max_height = 20, -- Limit height to avoid huge floats
		max_width = 80, -- Use integer for width to avoid 'non-integral' error
		winhighlight = "Normal:DiagnosticNormal,FloatBorder:DiagnosticBorder",
		win_options = { -- Extra float tweaks
			wrap = true, -- Reinforce wrapping
			linebreak = true, -- Break at word boundaries
		},
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "cs", "vb" },
	callback = function()
		vim.lsp.enable("omnisharp")
	end,
})

vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		if vim.fn.argc() == 0 and vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
			vim.api.nvim_buf_delete(0, { force = true })
			require("snacks").dashboard()
		end
	end,
	once = true,
})

vim.opt.shell = "nu"
