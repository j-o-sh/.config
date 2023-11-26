local lsp = require('lsp-zero')
lsp.extend_lspconfig()

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

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
    'html',
    'lua_ls',
    'volar'
  },
  handlers = {
    lsp.default_setup,
  },
})

