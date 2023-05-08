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

vim.opt.runtimepath:prepend(lazypath)

-- Remap space as leader key
-- Must be before lazy
vim.keymap.set("", "<Space>", "<Nop>", { silent = true, noremap = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup("core.plugins", {
  checker = {
    enabled = true, -- check for plugin updates
    frequency = 36000, -- check for updates every 10 hours
  }
})

