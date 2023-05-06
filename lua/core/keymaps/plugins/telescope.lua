local opts = { noremap = true, silent = true }

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.git_files, opts, { desc = "Find file within git project"})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, opts, { desc = "Search for string within project"})
vim.keymap.set('n', '<leader>fg', builtin.git_files, opts, { desc = "Find searching all files"})

vim.keymap.set('n', '<leader>bb', builtin.buffers, opts)

