-- This file is used to install and set the colorscheme that will be used
-- within the editor for now I've set this to be gruvbox. This will then
-- require the matching config file in the apperance directory and setup all of
-- the necessary values for the colorscheme to work within the terminal it is
-- called from

local M = {
  'morhetz/gruvbox',
  config = function()
    require("core.apperance.gruvbox")
  end
}

return M
