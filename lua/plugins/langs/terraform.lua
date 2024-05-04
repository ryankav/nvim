return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "terraform", "hcl" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "terraformls" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      terraformls = {},
    },
  },
  {
    -- TODO: linter isn't avialiable in mason need to check if available instead
    "mfussenegger/nvim-lint",
    opts = {
      -- terraform = { "terraform_validate" },
      -- tf = { "terraform_validate" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
      },
    },
  },
}
