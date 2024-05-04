return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "dockerfile" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "dockerls", "docker_compose_language_service" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      dockerls = {},
      docker_compose_language_service = {},
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      dockerfile = { "hadolint" },
    },
  },
}
