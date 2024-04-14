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
    ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
  },
  -- Keybindings for selection with treesitter text objects
  move = {
    goto_next_start = {
      ["]f"] = "@function.outer",
      ["]c"] = { query = "@class.outer", desc = "Next class start" },
      ["]o"] = "@loop.*",
      ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
    },
    goto_next_end = {
      ["]F"] = "@function.outer",
      ["]C"] = "@class.outer",
      ["]S"] = { query = "@scope", query_group = "locals", desc = "End of scope" },
    },
    goto_previous_start = {
      ["[f"] = "@function.outer",
      ["[c"] = "@class.outer",
      ["[s"] = { query = "@scope", query_group = "locals", desc = "Start of last scope" },
    },
    goto_previous_end = {
      ["[F"] = "@function.outer",
      ["[C"] = "@class.outer",
      ["[S"] = { query = "@scope", query_group = "locals", desc = "End of last scope" },
    },
    goto_next = {
      ["]t"] = "@conditional.outer",
    },
    goto_previous = {
      ["[t"] = "@conditional.outer",
    },
  },
}

return M
