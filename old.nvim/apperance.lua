vim.cmd('colorscheme rose-pine')

-- remove background --
vim.api.nvim_set_hl(0, "ZenBg", { ctermbg = 0 })

-- local colorChanges = { bg = "none", sp = "none" }
vim.api.nvim_set_hl(0, "Normal", { bg = "none" } )
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" } )
-- vim.api.nvim_set_hl(0,

local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.breakindent = true
opt.wrap = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.incsearch = true
opt.scrolloff = 8

-- start in Zen Mode
-- require("true-zen.ataraxis").on()

-- opt.colorcolumn = '80'

-- This is a very long comment, because I want to see it wrap... Dann dann dann dann dannnnnn


