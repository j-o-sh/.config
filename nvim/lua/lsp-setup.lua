local lsp = require('lsp-zero')
lsp.extend_lspconfig()

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  local opts = { buffer = bufnr, remap = false }
  local remap = require('remap')
  remap.lsp(bufnr)
end)

require 'lspconfig'.sourcekit.setup {}
lsp.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'eslint',
    'bashls',
    'clangd',
    'cssls',
    'gopls',
    'lua_ls',
    'volar'
  },
  handlers = {
    lsp.default_setup,
  },
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  },
})
