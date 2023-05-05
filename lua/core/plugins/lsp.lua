local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Run after the language server installer is setup from mason.lua
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- Run after the completion plugin is setup in cmp.lua
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    -- add null-ls for linter support. Requires plenary
    "jose-elias-alvarez/null-ls.nvim",
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local diagnostic_config = {
      virtual_text = true,
      signs = {
        active = signs,
      },
      update_in_insert = true,
      underline = true,
    }

    vim.diagnostic.config(diagnostic_config)

    -- setup the actual language servers
    require("core.lsp").setup()
  end,
}

return M

