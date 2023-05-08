local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "rose-pine/neovim",
  },
  config = function ()
    require("lualine").setup {}
  end
}

return M

