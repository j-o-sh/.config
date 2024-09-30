return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
  },
  opts = {
    ensure_installed = {
      'lua_ls', 'ts_ls', 'volar', 'gopls'
    },
    automatic_installation = true,
  },
}
