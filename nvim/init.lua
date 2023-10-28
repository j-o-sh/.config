local options = require 'options'

-- Set leader keys first
--
vim.g.mapleader = options.keys.leader
vim.g.maplocalleader = options.keys.leader

-- Plugins

local plugins = require("plugins")

-- Package Manager (lazy)
function pm(plugins, options)
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
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins, options)
end

pm(plugins)

-- LSP Setup

require('lsp-setup')
require('treesitter-setup')
require("luasnip.loaders.from_vscode").lazy_load()

-- Window Options

vim.wo.number = options.apperance.number
vim.opt.number = options.apperance.number

for key, value in pairs(options.vim) do
  vim.opt[key] = value
end

vim.cmd("colorscheme " .. options.apperance.colorscheme)

-- Keymaps
vim.keymap.set("n", options.keys.normal.movelineUp, ":move +1<cr>")
vim.keymap.set("n", options.keys.normal.movelineDown, ":move -2<cr>")

local remap = require('remap')
remap.global()
remap.telescope()
remap.snip()

