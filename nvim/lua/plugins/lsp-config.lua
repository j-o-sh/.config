local Keys = function(wk, buffer)
  return function(keys, command, desc)
    wk.register({ ['<leader>' .. keys] = { command, desc, buffer = buffer } })
  end
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'folke/which-key.nvim',
  },
  init = function()
    require('mason').setup()
    require('mason-lspconfig').setup()
    local wk = require('which-key')

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    wk.register({ ['<leader>i'] = { '+[i]nfo' } })
    wk.register({ ['<leader>g'] = { '+[g]o to' } })
    wk.register({ ['<leader>c'] = { '+[c]ode' } })

    wk.register({
      ['<leader>id'] = {
        vim.diagnostic.open_float,
        'open [i]nfo [d]iagnostics'
      }
    })
    -- vim.keymap.set('n', '<leader>id', vim.diagnostic.open_float)
    -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    -- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local rk = Keys(wk, ev.buf)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local vlb = vim.lsp.buf
        rk('gd', vlb.definition, '[g]o to [d]efinition')
        rk('gD', vlb.declaration, '[g]o to [D]eclaration')
        rk('gi', vlb.implementation, '[g]o to [i]mplementation')
        rk('gr', vlb.references, '[g]o to [r]eferences')

        rk('ih', vlb.hover, 'open [i]nfo on [h]over')
        rk('is', vlb.signature_help, 'open [i]nfo on [s]ignature help')

        -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<leader>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)

        rk('cr', vlb.rename, '[c]ode [r]ename')
        rk('ca', vlb.code_action, '[c]ode [a]ction')
        rk('cf', function() vlb.format({ async = true }) end, '[c]ode [f]ormat')
        -- vim.keymap.set('n', '<leader>f', function()
        --   vim.lsp.buf.format { async = true }
        -- end, opts)
      end,
    })
  end,
}
