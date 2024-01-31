local options = require "options"

return {
  first = function ()
    -- Set leader keys first
    vim.g.mapleader = options.keys.leader
    vim.g.maplocalleader = options.keys.leader
  end,

  last = function ()
    vim.cmd.colorscheme(options.colorscheme)
  end
}

