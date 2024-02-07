return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    window = {
      border = 'single',
    },
    ignore_missing = true,
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

