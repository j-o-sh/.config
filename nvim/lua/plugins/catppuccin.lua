return { "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = {
  flavour = "mocha",
  transparent_background = true,
  highlight_overrides = {
    all = function(colors)
      return {
        LineNr = { fg = colors.overlay1 }
      }
    end
  }
}}

