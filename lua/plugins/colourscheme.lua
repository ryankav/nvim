return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  opts = {
    disable_italics = true,
  },
  config = function()
    vim.cmd([[colorscheme rose-pine]])
  end,
}
