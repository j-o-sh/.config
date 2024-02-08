local cmp = require('cmp')

return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
  },
  opts = {
    snippet = {
      -- expand = function(args)
      expand = function()
      end,
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp'},
      { name = 'buffer' },
    }),
  }
}
