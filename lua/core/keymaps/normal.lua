-- This file contains the keybindings for neovim whilst in normal mode

-- This command just means that the command on the RHS isn't expanded to new
-- mappings that I have defiend before
local opts = { noremap = true, silent = true }

-- Panel navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

