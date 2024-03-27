local M = {
  "rose-pine/neovim",
  name = "default-colourscheme",
  lazy = false,
  priority = 1000,
  opts = {
    disable_italics = true,
  },
  config = function()
    vim.cmd([[colorscheme rose-pine]])
  end
}

return M
