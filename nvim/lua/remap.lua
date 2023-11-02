local function remap (mapping, action, mapopts, mode)
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

  -- Remap for dealing with word wrap
  remap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  remap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

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

  remap('<leader>gf', tele.git_files, { desc = 'Search [G]it [F]iles' })
  remap('<leader>sf', tele.find_files, { desc = '[S]earch [F]iles' })
  remap('<leader>sh', tele.help_tags, { desc = '[S]earch [H]elp' })
  remap('<leader>sw', tele.grep_string, { desc = '[S]earch current [W]ord' })
  remap('<leader>sg', tele.live_grep, { desc = '[S]earch by [G]rep' })
  remap('<leader>sd', tele.diagnostics, { desc = '[S]earch [D]iagnostics' })
  remap('<leader>sr', tele.resume, { desc = '[S]earch [R]esume' })

  -- Diagnostic keymaps
  remap('[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
  remap(']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
  remap('<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
  remap('<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
end

