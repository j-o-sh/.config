-- Package Manager (lazy)
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
require("lazy").setup(plugins(), {})


-- Window Options

vim.wo.number = true

-- Plugins

function plugins() {
  return {
    
  }
}


-- Keymaps

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

