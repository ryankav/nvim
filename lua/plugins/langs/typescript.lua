return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "tsserver" })
    end,
  },
  -- TODO: look into the tsserver specific nvim plugin https://github.com/pmizio/typescript-tools.nvim
  {
    "neovim/nvim-lspconfig",
    opts = {
      tsserver = {},
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
      },
    },
  },
}
