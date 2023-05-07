local opts = { noremap = true, silent = true }

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.git_files, opts, { desc = "File find within git"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts, { desc = "File grep"})
vim.keymap.set('n', '<leader>fs', builtin.git_files, opts, { desc = "File search within cwd"})

vim.keymap.set('n', '<leader>bb', builtin.buffers, opts)

