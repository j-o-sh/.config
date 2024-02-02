local options = require "options"

return {
  first = function ()
    -- Set leader keys first
    vim.g.mapleader = options.keys.leader
    vim.g.maplocalleader = options.keys.leader
  end,

  last = function ()
    vim.cmd.colorscheme(options.colorscheme)

    local vimOpts = {
      number = true,
      relativenumber = true,
      breakindent = true,
      wrap = true,
      tabstop = 2,
      softtabstop = 2,
      shiftwidth = 2,
      expandtab = true,
      incsearch = true,
      scrolloff = 8,

      foldlevel = 666,
      foldmethod = 'indent'
    }

    for key, value in pairs(vimOpts) do
      vim.opt[key] = value
    end
  end
}

