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
  remap('<leader>ff', tele.find_files, { desc = '[F]earch [F]iles' })
  remap('<leader>fh', tele.help_tags, { desc = '[F]ind [H]elp' })
  remap('<leader>fw', tele.grep_string, { desc = '[F]ind current [W]ord' })
  remap('<leader>fg', tele.live_grep, { desc = '[F]ind by [G]rep' })
  remap('<leader>fd', tele.diagnostics, { desc = '[F]ind [D]iagnostics' })
  remap('<leader>fr', tele.resume, { desc = '[F]ind [R]esume' })

-- vim.api.nvim_set_keymap('n', '<leader>e', ':lua require("nvim-tree").toggle()<CR>', {noremap = true, silent = true})
  -- local tree = require("nvim-tree")
  remap('<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true, desc = "[E]xplore files"})

  -- Diagnostic keymaps
  remap('[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
  remap(']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
  remap('<leader>li', vim.diagnostic.open_float, { desc = '[L]sp floating diagnostic [i]nfo' })
  remap('<leader>ll', vim.diagnostic.setloclist, { desc = '[L]sp diagnostics [l]ist' })
end




