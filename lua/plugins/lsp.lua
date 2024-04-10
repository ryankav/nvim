return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason.nvim",
    "mason-lspconfig.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function(_, opts)
    require("lspconfig").lua_ls.setup({})
  end
}
