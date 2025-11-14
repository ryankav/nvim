vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Faster save" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "[B]uffer delete" })

--TODO: fix the buffer mapping here as not navigating as intended
vim.keymap.set("n", "<leader><Space>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader><S-Space>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })

vim.keymap.set("n", "gh", "^", { desc = "[G]o to start of line" })
vim.keymap.set("n", "gl", "$", { desc = "[G]o to end of line" })

return {
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {
    spec = {
      { "g", group = "[G]o to" },
      { "<leader>q", group = "[Q]uickfix" },
      { "<leader>t", group = "[T]oggle"},
      { "[", group = "Previous" },
      { "]", group = "Next" }
    },
  },
}
