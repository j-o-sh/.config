return {
  "folke/which-key.nvim",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    { 'echasnovski/mini.icons', version = false }
  },
  event = "VeryLazy",
  opts = {
    win = {
      border = 'single',
    },
    filter = function(mapping)
      return mapping.desc and mapping.desc ~= ""
    end,
  },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

  end
}

