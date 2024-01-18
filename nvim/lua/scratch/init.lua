local options = require 'scratch.options'

-- Set leader keys first
--
vim.g.mapleader = options.keys.leader
vim.g.maplocalleader = options.keys.leader

-- require 'unstable'
require 'scratch.tj-kickstart'
-- require('my-lazy').setup(require('my-plugins'))


local lspcfg = require('lspconfig')
lspcfg.sourcekit.setup {
  cmd = {"sourcekit-lsp"},
  filetypes = {"swift"},
  root_dir = lspcfg.util.root_pattern(".git", "Package.swift"),
}
-- Window Options

vim.wo.number = options.apperance.number
vim.opt.number = options.apperance.number

for key, value in pairs(options.vim) do
  vim.opt[key] = value
end

-- Color Schema

vim.cmd("colorscheme " .. options.apperance.colorscheme)

-- Set the background to transparent
vim.cmd('highlight Normal ctermbg=none guibg=none')

require('scratch.remap')(options)

