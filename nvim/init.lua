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

-- Plugins

function plugins ()
  return {
    'tpope/vim-sleuth',    
  }
end

pm(plugins())

-- Window Options

vim.wo.number = true


-- Keymaps

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


