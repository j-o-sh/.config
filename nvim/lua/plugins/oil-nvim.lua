return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'folke/which-key.nvim',
  },
  init = function ()
    local wk = require('which-key')

    wk.register({ ['<leader>o'] = { '+[o]open' } })
    wk.register({ ['<leader>oc'] = { '<CMD>Oil<CR>', '[o]pen [c]urrent directory' } })
  end
}
