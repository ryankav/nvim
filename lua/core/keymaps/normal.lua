-- This file contains the keybindings for neovim whilst in normal mode

-- This command just means that the command on the RHS isn"t expanded to new
-- mappings that I have defiend before
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>ft", vim.cmd.Ex, { desc = "Open file tree"})

-- Panel navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Global lsp related keymappings
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor after page jump"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor after page jump"})
vim.keymap.set("n", "n", "nzz", { desc = "Center cursor search"})
vim.keymap.set("n", "N", "Nzz", { desc = "Center cursor search"})


