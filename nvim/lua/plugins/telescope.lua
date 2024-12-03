return {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    'folke/which-key.nvim'
  },
  init = function ()
    local wk = require('which-key')
    local builtin = require('telescope.builtin')

    wk.add({
      { '<leader>f', group = '+[f]ind' },
      { '<leader>ff', '<CMD>Telescope find_files<CR>', desc = '[f]ind [f]iles' },
      { '<leader>fw', builtin.grep_string, desc = '[f]ind the current [w]ord' },
      { '<leader>fW', builtin.live_grep, desc = '[f]ind some [W]ords' },
      { '<leader>fb', '<CMD>Telescope buffers<CR>', desc = '[f]ind in [b]uffers' },
      { '<leader>fB', builtin.current_buffer_fuzzy_find, desc = '[f]ind in current [B]uffer' },
      { '<leader>fg', builtin.git_files, desc = '[f]ind in [g]it files' },
      { '<leader>fq', builtin.quickfix, desc = '[f]ind in [q]uickfix list' },
    })
  end
}
