-- This file contains the keybindings for neovim whilst in normal mode

-- This command just means that the command on the RHS isn"t expanded to new
-- mappings that I have defiend before
local opts_with_desc = function(desc)
  return { noremap = true, silent = true,  desc = desc}
end

-- experimental mappings within normal mode
vim.keymap.set("n", "<leader>w", ":w<CR>", opts_with_desc("Faster save"))
vim.keymap.set("n", "<leader><leader>", "<C-^>", opts_with_desc("Toggle to last seen buffer"))
vim.keymap.set("n", "H", "^", opts_with_desc("Jump to start of line"))
vim.keymap.set("n", "L", "$", opts_with_desc("Jump to end of line"))

-- Open file tree
vim.keymap.set("n", "<leader>ft", vim.cmd.Ex, opts_with_desc("Open file tree"))

-- Panel navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts_with_desc("Move left in pannels"))
vim.keymap.set("n", "<C-j>", "<C-w>j", opts_with_desc("Move down in pannels"))
vim.keymap.set("n", "<C-k>", "<C-w>k", opts_with_desc("Move up in pannels"))
vim.keymap.set("n", "<C-l>", "<C-w>l", opts_with_desc("Move right in pannels"))

-- Global lsp related keymappings
vim.keymap.set("n", "<leader>ll", vim.diagnostic.open_float, opts_with_desc("Open linter message"))

-- Cursor centering after jump commands
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts_with_desc("Page down and center"))
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts_with_desc("Page up and center"))
vim.keymap.set("n", "n", "nzz", opts_with_desc("Next and center"))
vim.keymap.set("n", "N", "Nzz", opts_with_desc("Next and center"))

