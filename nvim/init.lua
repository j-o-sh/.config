-- Set leader keys first
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set up lazy
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


-- All the plugins
require("lazy").setup("plugins")

-- All the colors
vim.cmd.colorscheme('catppuccin')

-- Vim Options
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
  signcolumn = 'yes',

  foldlevel = 666,
  foldmethod = 'indent'
}

for key, value in pairs(vimOpts) do
  vim.opt[key] = value
end
