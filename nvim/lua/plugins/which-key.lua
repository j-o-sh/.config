return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
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

      { "<leader>b", group = "[b]uffers" },
      { "<leader>c", group = "[c]ode" },
      { "<leader>f", group = "[f]ind" },
      { "<leader>o", group = "[o]pen" },
      { "<leader>n", group = "[n]otify" },
      { "<leader>r", group = "[r]epository" },
      { "<leader>w", group = "[w]indow" },
    },
  },
}
