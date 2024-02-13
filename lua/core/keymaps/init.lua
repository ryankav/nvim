-- This command just means that the command on the RHS isn"t expanded to new
-- mappings that I have defiend before
local opts_with_desc = function(desc)
  return { noremap = true, silent = true,  desc = desc}
end

-- Insert Mode key maps --------------------------------------------------------

vim.keymap.set("i", "jk", "<ESC>", opts_with_desc("Experimental faster exit"))
vim.keymap.set("i", "kj", "<ESC>", opts_with_desc("Experimental faster exit"))

-- Normal Mode key maps --------------------------------------------------------

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

-- buffer specific mappings
vim.keymap.set('n', '<leader>bd', "<cmd>bdelete<CR>", opts_with_desc("Delete current buffer, fails if edit"))
vim.keymap.set('n', '<leader>bD', "<cmd>bwipeout!<CR>", opts_with_desc("Wipeout current buffer, deletes no matter what"))

-- Quick fix specific keybindings
vim.keymap.set('n', '<leader>qn', "<cmd>cnext<CR>", opts_with_desc("Go to next quick fix"))
vim.keymap.set('n', '<leader>qN', "<cmd>cprevious<CR>", opts_with_desc("Go to previous quick fix"))

-- Visual Mode key maps --------------------------------------------------------

vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv", opts_with_desc("Move highlighted down"))
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv", opts_with_desc("Move highlighted up"))

