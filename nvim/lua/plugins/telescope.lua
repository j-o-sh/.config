return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'folke/which-key.nvim',
  },
  init = function()
    local builtin = require('telescope.builtin')
    local wk = require('which-key')

    wk.register({ ['<leader>f'] = { '+[f]ind' } })
    wk.register({ ['<leader>ff'] = { builtin.find_files, '[f]ind [f]iles' } })
    wk.register({ ['<leader>fg'] = { builtin.live_grep, '[f]ind by [g]rep' } })
    wk.register({ ['<leader>fb'] = { builtin.buffers, '[f]ind in [b]uffers' } })
    wk.register({ ['<leader>fh'] = { builtin.help_tags, '[f]ind in [h]elp tags' } })
  end
}

