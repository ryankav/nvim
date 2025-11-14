local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Remap space as leader key this must be done before requiring lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.autocmd")

-- Require lazy and point the setup to the plugins directory whilst also
-- providing the desired config overrides for lazy
require("lazy").setup({
  spec = {
    -- Have lazy manage itelf
    { "folke/lazy.nvim", version = "*" },
    { import = "plugins" },
    { import = "langs" },
  },
  checker = { enabled = true }, -- Automatically check for plugin updates
})
