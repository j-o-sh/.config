return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
  },
  init = function()
    require('mason').setup()
    require('mason-lspconfig').setup()

    -- local lspconfig = require('lspconfig')
    -- lspconfig.lua_ls.setup {}
  end,
}
