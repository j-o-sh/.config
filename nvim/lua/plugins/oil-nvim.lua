return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'folke/which-key.nvim',
  },
  init = function ()
    local wk = require('which-key')

    wk.add({
      { '<leader>o', group = '+[o]open' },
      { '<leader>oc', '<CMD>Oil<CR>', desc = '[o]pen [c]urrent directory' },
    })
  end
}
