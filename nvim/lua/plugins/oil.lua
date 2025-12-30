return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      keymaps = {
        ["<ESC>"] = { "actions.close", mode = "n" },
      },
      float = {
        max_width = 120,
        max_height = 50,
        border = 'rounded',
      },
    },
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
    keys = {
      { "<leader>oc", "<CMD>Oil --float<CR>", desc = "[o]pen [c]urrent directory"},
      { "<leader>op", "<CMD>Oil . --float<CR>", desc = "[o]pen [c]urrent directory"},
    }
  },
  { "benomahony/oil-git.nvim" }
}
