local opts_with_desc = function(desc)
  return { noremap = true, silent = true,  desc = desc}
end

-- experimental key mappings
vim.keymap.set("i", "jk", "<ESC>", opts_with_desc("Experimental faster exit"))
vim.keymap.set("i", "kj", "<ESC>", opts_with_desc("Experimental faster exit"))

