-- File to set vim options
-- to see more details on the options run `:help options`
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

-- Setup so that vim can undo and will store files for extended period of time
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Removes search highlighting once I'm done searching
vim.opt.hlsearch = false
-- Shows a search highlighting whilst still typing the regex
vim.opt.incsearch = true

-- ensure there are 8 rows above and below on scroll when possible
vim.opt.scrolloff = 8

-- Add extra column for signs on the LHS. Useful to prevent jitter with lsp
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- TODO: Look into vimscript commands I want to update
-- TODO: Look into more classical vim options I want to change 

