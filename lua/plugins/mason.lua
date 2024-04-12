-- This file sets up Mason to manage the tools needed for development work.
-- Outside of mason itself and mason-lspconfig the remaining packages are
-- less frequently used and potentially more of a gamble
return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    lazy = false,
    config = function(_, _)
      require("mason").setup()
    end
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
      -- Prevent default linters within nvim-lint from being installed
      automatic_installation = false,
    },
  },
  {
    "zapling/mason-conform.nvim",
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
