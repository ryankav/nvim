return {
  "neovim/nvim-lspconfig",
  -- Add the dependencies here so that later on in the lang modules
  -- the ordering of plugins is preserved
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {},
  -- servers will be populated by each language module
  servers = {},
}
