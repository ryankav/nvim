-- This file contains the keymappings whilst in visual mode

-- Move text up and down
-- TODO: Add check to command for EOF to prevent out of range movement
vim.keymap.set("v", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("v", "K", ":move '<-2<CR>gv-gv", opts)

