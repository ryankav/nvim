vim.keymap.set("n", "<leader>tbf", function()
  local bufnr = vim.fn.bufnr("%")
  vim.b[bufnr].disable_autoformat = not vim.b[bufnr].disable_autoformat
  vim.notify("Buffer autoformat disabled: " .. tostring(vim.b.disable_autoformat), vim.log.levels.INFO)
end, { desc = "[T]oggle [B]uffer auto[F]ormat" })
vim.keymap.set("n", "<leader>tgf", function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  vim.notify("Global autoformat disabled: " .. tostring(vim.g.disable_autoformat), vim.log.levels.INFO)
end, { desc = "[T]oggle [G]lobal auto[F]ormat" })

return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    dependencies = { "mason.nvim" },
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
      -- This will be populated in the langs directory where each lang will define the tools they use
      formatters_by_ft = {},
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    "zapling/mason-conform.nvim",
    event = "BufWritePre",
    dependencies = {
      "mason.nvim",
      "conform.nvim",
    },
    opts = {},
  },
}
