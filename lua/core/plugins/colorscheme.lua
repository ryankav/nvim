-- This file is used to install and set the colorscheme that will be used
-- within the editor for now I've set this to be gruvbox. This will then
-- require the config file in the apperance directory that will perform all
-- the actual setup, so that the colorscheme works correctly in the editor

local M = {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    require("core.apperance.colorscheme")
  end
}

return M
