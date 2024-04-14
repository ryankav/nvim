return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason.nvim",
    "mason-lspconfig.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  -- opts will be a map of the lsp server to setup and it's config
  -- which will be populated from the lang module
  opts = {},
  config = function(_, opts)
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

    local lspconfig = require("lspconfig")

    for server, server_opts in pairs(opts) do
      lspconfig[server].setup(server_opts)
    end
  end,
}
