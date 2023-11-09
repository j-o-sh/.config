return {
  -- 'mg979/vim-visual-multi'
  { "ellisonleao/gruvbox.nvim", priority = 1000,  config = true, opts = ... },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
}

