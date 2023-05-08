local opts_with_desc = function(desc)
  return { noremap = true, silent = true,  desc = desc}
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.git_files, opts_with_desc("File find within git"))
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts_with_desc("File grep"))
vim.keymap.set('n', '<leader>fs', builtin.git_files, opts_with_desc("File search within cwd"))

vim.keymap.set('n', '<leader>bb', builtin.buffers, opts_with_desc("List open buffers"))

