return {
  -- 'mg979/vim-visual-multi'
  { "ellisonleao/gruvbox.nvim", priority = 1000,  config = true, opts = ... },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end
  },
  -- {
  --   'goolord/alpha-nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- config = function ()
    --   require'alpha'.setup(require'alpha.themes.startify'.config)
    -- end
  -- },
}

