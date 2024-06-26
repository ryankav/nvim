local M = {}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "Faster exit" })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true, desc = "Faster exit" })

vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Faster save" })
vim.keymap.set(
  { "i", "x", "n", "s" },
  "<C-s>",
  "<cmd>w<cr><esc>",
  { noremap = true, silent = true, desc = "Save File" }
)
vim.keymap.set("n", "<leader><leader>", "<C-^>", { noremap = true, silent = true, desc = "Toggle to last seen buffer" })
vim.keymap.set("n", "H", "^", { noremap = true, silent = true, desc = "Jump to start of line" })
vim.keymap.set("n", "L", "$", { noremap = true, silent = true, desc = "Jump to end of line" })
vim.keymap.set(
  { "i", "n" },
  "<esc>",
  "<cmd>noh<cr><esc>",
  { noremap = true, silent = true, desc = "Escape and Clear hlsearch" }
)
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Group indent left" })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Group indent right" })

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

vim.keymap.set(
  "n",
  "<leader>bd",
  "<cmd>bdelete<CR>",
  { noremap = true, silent = true, desc = "Delete current buffer, fails if edit" }
)
vim.keymap.set(
  "n",
  "<leader>bD",
  "<cmd>bwipeout!<CR>",
  { noremap = true, silent = true, desc = "Wipeout current buffer, deletes no matter what" }
)

vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

M.treesitter = {
  -- Keybindings for selection with treesitter text objects
  select = {
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["ac"] = "@class.outer",
    ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
    ["ab"] = "@block.outer",
    ["ib"] = "@block.inner",
    ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
  },
  -- Keybindings for selection with treesitter text objects
  move = {
    goto_next_start = {
      ["]f"] = "@function.outer",
      ["]c"] = { query = "@class.outer", desc = "Next class start" },
      ["]o"] = "@loop.*",
      ["]b"] = "@block.outer",
    },
    goto_next_end = {
      ["]F"] = "@function.outer",
      ["]C"] = "@class.outer",
      ["]B"] = "@block.outer",
    },
    goto_previous_start = {
      ["[f"] = "@function.outer",
      ["[c"] = "@class.outer",
      ["[b"] = "@block.outer",
    },
    goto_previous_end = {
      ["[F"] = "@function.outer",
      ["[C"] = "@class.outer",
      ["[B"] = "@block.outer",
    },
    goto_next = {
      ["]j"] = "@conditional.outer",
    },
    goto_previous = {
      ["[j"] = "@conditional.outer",
    },
  },
}

return M
