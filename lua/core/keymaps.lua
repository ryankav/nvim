-- setup the local variables need in rest of the file
local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal mode = "n"
--   insert mode = "i"
--   visual mode = "v"
--   visual block mode = "x"
--   term mode = "t"
--   command mode = "c"

-- Normal mode

-- Panel navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Visual --

-- Move text up and down
-- TODO: Add check to command for EOF to prevent out of range movement
keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)

