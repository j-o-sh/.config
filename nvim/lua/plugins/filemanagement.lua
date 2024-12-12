return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      keymaps = {
        ["<ESC>"] = { "actions.close", mode = "n" },
      }
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    init = function()
      local wk = require("which-key")

      wk.add({
        { "<leader>oc", "<CMD>Oil --float<CR>", desc = "[o]pen [c]urrent directory" },
        { "<leader>op", "<CMD>Oil . --float<CR>", desc = "[o]pen [p]roject directory" },
      })
    end,
  },
}
