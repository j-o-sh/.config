local function globalkeys()
  -- vim.g.mapleader = " "
  vim.api.nvim_set_keymap('n', '<C-j>', '<C-d>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<C-k>', '<C-u>', { noremap = true })
  vim.keymap.set("n", "<leader>p", vim.cmd.Ex)
  vim.keymap.set("n", "<leader>m", ":move +1<cr>")
  vim.keymap.set("n", "<leader>n", ":move -2<cr>")
end

-- Telescope Bindings --
local function telescopekeys()
  local telescope = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
  vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
  vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
  vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
  vim.keymap.set('n', '<leader>fs', function() telescope.grep_string({ search = vim.fn.input("?>") }) end)
end

-- LSP Bindings --
local function lspkeys(buffer)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)
  vim.keymap.set('n', '<leader>jd', vim.lsp.buf.definition,
    { buffer = buffer, remap = false }
  )
end

-- Snippet Bindings --
local function snip()
  local opts = {}
  vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>luasnip-expand-or-jump', opts)
  vim.api.nvim_set_keymap('i', '<C-k>', '<Plug>luasnip-jump-prev', opts)
  vim.api.nvim_set_keymap('i', '<C-l>', '<Plug>luasnip-jump-next', opts)
  vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>luasnip-jump-out', opts)
end

return {
  global = globalkeys,
  telescope = telescopekeys,
  lsp = lspkeys,
  snip = snip
}
