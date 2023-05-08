-- This file contains the keymappings whilst in visual mode

-- Move text up and down
-- TODO: Add check to command for EOF to prevent out of range movement
local opts_with_desc = function(desc)
  return { noremap = true, silent = true,  desc = desc}
end

vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv", opts_with_desc("Move highlighted down"))
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv", opts_with_desc("Move highlighted up"))

