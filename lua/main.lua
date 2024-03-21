local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Remap space as leader key this must be done before requiring lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Require lazy and point the setup to the plugins directory whilst also
-- providing the desired config overrides for lazy
require("lazy").setup("plugins", {
  defaults = {
    lazy = true,
    version = false
  },
  checker = { enabled = true }, -- Automatically check for plugin updates
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
