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


-- Window Options

vim.wo.number = true
require('apperance')

-- Keymaps

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_set_keymap('n', '<C-j>', '<C-d>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-u>', { noremap = true })


--- Telescope

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})



