return {
  'folke/trouble.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'folke/which-key.nvim',
  },
  opts = {
    auto_open = false,
    auto_close = true,
  },
  init = function ()
    local tr = require 'trouble'
    local wk = require 'which-key'

    local toggle = function (mode) tr.toggle(mode) end
    wk.register({ ['<leader>t'] = { '+[t]rouble' } })
    wk.register({ ['<leader>tc'] = { tr.close, '[t]rouble [c]lose' } })
    wk.register({ ['<leader>tt'] = { tr.toggle, '[t]rouble [t]oggle' } })
    wk.register({ ['<leader>tw'] = { toggle('workspace_diagnostics'), '[t]rouble: [w]orkspace diagnostics' } })
    wk.register({ ['<leader>td'] = { toggle('document_diagnostics'), '[t]rouble: [d]ocument diagnostics' } })
    wk.register({ ['<leader>tq'] = { toggle('quickfix'), '[t]rouble: [q]uickfix' } })
    wk.register({ ['<leader>tl'] = { toggle('loclist'), '[t]rouble: [l]oclist' } })

    wk.register({ ['<leader>tr'] = { toggle('lsp_references'), '[t]rouble: lsp [r]eferences' } })

    tr.close()
  end
}

