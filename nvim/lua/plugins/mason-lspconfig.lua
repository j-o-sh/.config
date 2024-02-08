return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
  },
  opts = {
    ensure_installed = {},
    automatic_installation = true,
  },
  init = function ()
    require('mason-lspconfig').setup_handlers {
      function (servername)
        local lspcfg = require('lspconfig')
        if not lspcfg then
          print('⚠️  no lspcfg found')
          return
        end

        if not lspcfg[servername] then
          print('⚠️  no lspcfg found for ' .. servername)
          return
        end

        local cmp = require('cmp_nvim_lsp')
        lspcfg[servername].setup {
          capabilities = cmp.default_capabilities()
        }
      end,
    }
  end,
}
