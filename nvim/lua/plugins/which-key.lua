local ut = require('utils').tables
local keys = require('keys')

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

    local wk = require('which-key')

    for _, group in pairs(keys.groups) do
      local cleangroup = {}
      for gk, gv in keys.kpairs(group) do
        cleangroup[gk] = gv[1]
      end
      cleangroup.name = group.name

      wk.register({
        [group.key] = cleangroup,
      }, { prefix = group.prefix })
    end

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

