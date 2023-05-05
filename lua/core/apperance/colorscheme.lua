-- TODO: look into using the base 16 color scheme builder to allow for a more
--       robust setup that will work across all terminals

  require("rose-pine").setup({
    disable_italics = true,
  })

  vim.cmd("colorscheme rose-pine")

