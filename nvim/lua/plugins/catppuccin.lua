return { 
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
  opts = {
    flavour = "mocha",
    transparent_background = true,
    float = {
      transparent = true,
    },
    highlight_overrides = {
      all = function(colors)
        return {
          LineNr = { fg = colors.overlay1 },
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
        }
      end,
    },
    auto_integrations = true,
    integrations = {
      -- Integeration are found here:
      -- https://github.com/catppuccin/nvim#integrations
    },
  }
}
