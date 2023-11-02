local options = require 'options'

-- Set leader keys first
--
vim.g.mapleader = options.keys.leader
vim.g.maplocalleader = options.keys.leader

-- require 'unstable'
require 'tj-kickstart'
-- require('my-lazy').setup(require('my-plugins'))

-- Window Options

vim.wo.number = options.apperance.number
vim.opt.number = options.apperance.number

for key, value in pairs(options.vim) do
  vim.opt[key] = value
end

-- Color Schema

vim.cmd("colorscheme " .. options.apperance.colorscheme)

require('remap')(options)

