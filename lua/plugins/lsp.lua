return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "mason.nvim",
    },
    opts = {
      -- This will be populated by the langs modules to ensure the required lsp server is installed
      ensure_installed = {},
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
  },
}
