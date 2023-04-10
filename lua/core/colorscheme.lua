-- set the terminal color variable to be true
vim.opt.termguicolors = true

local colorscheme = "default"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorcsheme " .. colorscheme .. " not found!")
  vim.opt.termguicolors = false 
  return
end

