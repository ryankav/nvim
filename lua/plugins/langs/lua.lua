return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "lua", "luadoc", "luap" },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls" },
    },
  },
  {
    "rshkarin/mason-nvim-lint",
    opts = {
      ensure_installed = { "selene" },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      lua = { "selene" },
    },
  }
}
