function remap (mapping, action, mapopts, mode)
  vim.keymap.set(mode or 'n', mapping, action, mapopts or {})
end

return function (options)
  -- Let's go
  local n = options.keys.normal

  -- Keymaps
  remap(n.movelineUp, ':move +1<cr>')
  remap(n.movelineDown, ':move -2<cr>')

  -- Keymaps for better default experience
  -- See `:help vim.keymap.set()`
  remap('<Space>', '<Nop>', { silent = true }, { 'n', 'v' })
  -- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

  -- Remap for dealing with word wrap
  remap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  remap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
  -- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'",
  --   { expr = true, silent = true }
  -- )
  -- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'",
  --   { expr = true, silent = true }
  -- )

  local tele = require('telescope.builtin')
  local fuzzybuffer = function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    tele.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end
  remap('<leader>?', tele.oldfiles, { desc = '[?] Find recently opened files' })
  remap('<leader><space>', tele.buffers, { desc = '[ ] Find existing buffers' })
  remap('<leader>/', fuzzybuffer, { desc = '[/] Fuzzily search in current buffer' })
  -- See `:help telescope.builtin`
  -- vim.keymap.set('n', '<leader>?', telescope.oldfiles, { desc = '[?] Find recently opened files' })
  -- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
  -- vim.keymap.set('n', '<leader>/', function()
  --   -- You can pass additional configuration to telescope to change theme, layout, etc.
  --   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
  --     winblend = 10,
  --     previewer = false,
  --   })
  -- end, { desc = '[/] Fuzzily search in current buffer' })

  vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
  vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
  vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
  vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
  vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
  vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
  vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

  -- Diagnostic keymaps
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
end

