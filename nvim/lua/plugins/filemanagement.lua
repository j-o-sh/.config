return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    init = function()
      local wk = require("which-key")

      wk.add({
        { "<leader>oc", "<CMD>Oil --float<CR>", desc = "[o]pen [c]urrent directory" },
      })
    end,
  },
}
