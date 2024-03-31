vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- TODO: look into the use of silent and remap for keybindings again.
vim.keymap.set("i", "jk", "<ESC>", { desc = "Faster exit" })
vim.keymap.set("i", "kj", "<ESC>", { desc = "Faster exit" })

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Faster save" })
