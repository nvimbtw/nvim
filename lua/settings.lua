-- Global variables
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Tab and indentation settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Other editor options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = false
vim.opt.listchars = { tab = ">> ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- Keymaps
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>x", "<cmd>x<cr>", { desc = "Save & Quit" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("n", "<leader><tab>", "<C-^>", { desc = "Switch to last buffer" })
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontal
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split vertical
vim.keymap.set("n", "<leader>stv", "<cmd>vsplit<bar>TvFiles<CR>")
vim.keymap.set("n", "<leader>so", "<C-w>o") -- only split
vim.keymap.set("n", "<leader>gh", "<C-w>h") -- go to left split
vim.keymap.set("n", "<leader>gj", "<C-w>j") -- go to bottom split
vim.keymap.set("n", "<leader>gk", "<C-w>k") -- go to top split
vim.keymap.set("n", "<leader>gl", "<C-w>l") -- go to right split
vim.keymap.set("n", "<leader>sm", "<cmd>SupermavenToggle<cr>", { desc = "Toggle Supermaven" })

vim.keymap.set("n", "<leader>t", function()
	vim.cmd("botright vsplit")
	vim.cmd("terminal")
	vim.cmd("startinsert")
end, { desc = "Open terminal in horizontal bottom split" })
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = "Escape terminal mode to normal mode" })

vim.keymap.set("n", "<leader>tg", function()
	vim.cmd("botright vsplit")
	vim.cmd("terminal")
	local chan = vim.b.terminal_job_id
	vim.api.nvim_chan_send(chan, "gemini\n")
	vim.cmd("startinsert")
end, { desc = "Open terminal in horizontal bottom split and run a command" })

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*", -- Matches all terminal buffers
	callback = function()
		vim.opt_local.number = true -- Show absolute number on current line
		vim.opt_local.relativenumber = true -- Show relative numbers on other lines
		vim.opt_local.signcolumn = "no" -- Optional: Hide signcolumn in terminal (cleaner look)
	end,
	desc = "Enable relative line numbers in terminals",
})

-- Toggle diagnostics
local diagnostics_active = true
vim.keymap.set("n", "<leader>td", function()
	diagnostics_active = not diagnostics_active
	if diagnostics_active then
		vim.diagnostic.enable()
	else
		vim.diagnostic.enable(false)
	end
	vim.notify("Diagnostics " .. (diagnostics_active and "enabled" or "disabled"))
end, { desc = "Toggle diagnostics" })
