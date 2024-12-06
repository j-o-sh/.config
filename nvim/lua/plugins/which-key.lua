return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    { "echasnovski/mini.icons", version = false },
  },
  opts = {
    preset = "modern",
    delay = 300,
    filter = function(mapping)
      return mapping.desc and mapping.desc ~= ""
    end,
    spec = {
      { "<leader>?", "<cmd>WhichKey<CR>", desc = "WhichKey Index" },

      { "<leader>r", group = "[r]epository" },
      { "<leader>o", group = "[o]pen" },
      { "<leader>c", group = "[c]ode" },
    },
  },
}
