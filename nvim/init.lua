-- Set leader keys first
--
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

-- Window Options

vim.wo.number = true
require('apperance')

-- Keymaps
local remap = require('remap')
remap.global()
remap.telescope()

