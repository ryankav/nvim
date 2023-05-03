local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require("telescope").setup {
      defaults = {
        mappings = {
          require("core.keymaps.plugins.telescope"),
        }
      },
      pickers = {},
      extensions = {},
    }
  end
}

return M

