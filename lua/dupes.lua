vim.keymap.set("n", "<leader>dd", "yyp", { desc = "Duplicate line below" })
vim.keymap.set("n", "<leader>du", "yyP", { desc = "Duplicate line above" })
vim.keymap.set("n", "<leader>dp", "yap}p", { desc = "Duplicate paragraph" })
vim.keymap.set("n", "<leader>db", "y%P", { desc = "[D]uplicate inside block" })
vim.keymap.set("n", "<leader>dt", "yyp0D", { desc = "[D]uplicate as template" })
vim.keymap.set("n", "<leader>d<Space>", "yypA", { desc = "[D]uplicate & insert" })

-- Move selection
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
