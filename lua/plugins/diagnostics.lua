local diagnostics = {
  DiagnosticSignError = "",
  DiagnosticSignWarn = "",
  DiagnosticSignHint = "",
  DiagnosticSignInfo = "",
}

-- Define the signs in vim so that they can be used by the lsp diagnostic config
for severity, icon in pairs(diagnostics) do
  vim.fn.sign_define(severity, { texthl = severity, text = icon, numhl = "" })
end

vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
  },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = diagnostics.DiagnosticSignError,
      [vim.diagnostic.severity.WARN] = diagnostics.DiagnosticSignWarn,
      [vim.diagnostic.severity.HINT] = diagnostics.DiagnosticSignHint,
      [vim.diagnostic.severity.INFO] = diagnostics.DiagnosticSignInfo,
    },
  },
})

return {
{
    "folke/trouble.nvim",
    opts = { auto_close = true },
    cmd = { "Trouble" },
    keys = {
      { "<leader>qb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "[Q]uickfix diagnostics in [B]uffer" },
      { "<leader>qs", "<cmd>Trouble symbols toggle<cr>", desc = "[Q]uickfix [S]ymbols" },
      { "<leader>ql", "<cmd>Trouble lsp toggle<cr>", desc = "[Q]uickfix from [L]sp" },
      { "<leader>qL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>qq", "<cmd>Trouble qflist toggle<cr>", desc = "[Q]uickfix [Q]uickfix list" }, -- TODO: come up with better desc once known
      { "<leader>qt", "<cmd>Trouble todo toggle<cr>", desc = "[Q]uickfix [T]odos"},
      {
        "[q",
        function()
          if require("trouble").is_open() then
            require("trouble").prev({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Previous [Q]uickfix Item",
      },
      {
        "]q",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Next [Q]uickfix Item",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble" },
    event = "VeryLazy",
    opts = {},
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next [T]odo Comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous [T]odo Comment" },
    },
  }
}
