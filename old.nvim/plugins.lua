return {
  { 'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'tpope/vim-fugitive' },

  -- LSP --
  {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
  },

  -- Comments
  { 'tpope/vim-commentary' },

  -- Color Schemas --
  { 'rose-pine/neovim', name = 'rose-pine' },
  { 'lukas-reineke/virt-column.nvim', config = function ()
    require("virt-column").setup()
    end
  },

  { 'folke/zen-mode.nvim', opts = {
    width = 80,
    backdrop = 0,
    on_open = function(_)
      vim.cmd 'cabbrev <buffer> q let b:quitting = 1 <bar> q'
      vim.cmd 'cabbrev <buffer> wq let b:quitting = 1 <bar> wq'
    end,
    on_close = function()
      if vim.b.quitting == 1 then
        vim.b.quitting = 0
        vim.cmd 'q'
      end
    end,
  }},

  -- misc. Appearance --
  { 'smithbm2316/centerpad.nvim' },
  { 'xiyaowong/transparent.nvim' }
}

