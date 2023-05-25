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
    -- wait till after telescope so keybindings work
    "nvim-telescope/telescope.nvim",
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
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = ""
      }
    }

    vim.diagnostic.config(diagnostic_config)

    vim.cmd([[
      set signcolumn=yes
      autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
    ]])

    -- setup the actual language servers
    require("core.lsp").setup_lsp()
  end,
}

return M

