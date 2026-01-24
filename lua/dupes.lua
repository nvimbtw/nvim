-- Yank/duplicate operations (moved from <leader>d to <leader>y to avoid conflict with DAP)
vim.keymap.set("n", "<leader>yd", "yyp", { desc = "Yank duplicate line below" })
vim.keymap.set("n", "<leader>yu", "yyP", { desc = "Yank duplicate line above" })
vim.keymap.set("n", "<leader>yp", "yap}p", { desc = "Yank duplicate paragraph" })
vim.keymap.set("n", "<leader>yb", "y%P", { desc = "Yank duplicate inside block" })
vim.keymap.set("n", "<leader>yt", "yyp0D", { desc = "Yank duplicate as template" })
vim.keymap.set("n", "<leader>y<Space>", "yypA", { desc = "Yank duplicate & insert" })

-- Move selection
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
