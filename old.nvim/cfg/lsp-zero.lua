require'lspconfig'.sourcekit.setup{}

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
end)

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'bashls',
  'clangd',
  'cssls',
  'gopls',
  'html',
  'jsonls',
  'lua_ls',
  'rust_analyzer',
  'svelte',
  -- 'sourcekit',
  'volar',
})

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  },
})

