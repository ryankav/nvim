return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason.nvim",
    "mason-lspconfig.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  -- opts will be a map of the lsp server to setup and it's config
  -- which will be populated from the lang module
  opts = {},
  config = function(_, opts)
    local lspconfig = require("lspconfig")

    for server, server_opts in pairs(opts) do
      lspconfig[server].setup(server_opts)
    end
  end
}
