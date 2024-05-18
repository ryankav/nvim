-- This file sets up Mason to manage the tools needed for development work.
-- Outside of mason itself and mason-lspconfig the remaining packages are
-- less frequently used and potentially more of a gamble. Events have to
-- be specified for the mason-conform & mason-nvim-lint plugins as they
-- have to be required after conform & nvim-lint.
return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "mason.nvim",
    },
    opts = {
      -- LSP servers to install that will be populated in langs module
      ensure_installed = {},
    },
  },
  {
    "rshkarin/mason-nvim-lint",
    event = "BufReadPost",
    dependencies = {
      "mason.nvim",
      "nvim-lint",
    },
    opts = {
      -- Linters to install that will be populated in langs module
      ensure_installed = {},
    },
  },
  {
    "zapling/mason-conform.nvim",
    event = "BufWritePre",
    dependencies = {
      "mason.nvim",
      "conform.nvim",
    },
    opts = {
      -- Formatters to install that will be populated in langs module
      ensure_installed = {},
    },
  },
}
