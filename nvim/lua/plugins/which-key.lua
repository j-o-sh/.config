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

    -- local wk = require('which-key')

    -- wk.register({
    --   s = {
    --     name = '[S]elect ...',
    --     i = '[I]nit Selection',
    --     n = 'Add [N]ode',
    --     s = 'Add [S]cope'
    --   },
    -- }, { prefix = "<leader>" })
  end
}

