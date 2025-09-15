return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    heading = { enabled = true },
    quote = {
      repeat_linebreak = true,
    },
    win_options = {
      showbreak = '  ',
      breakindent = 'true',
      breakindentopt = '',
    }
  },
}
