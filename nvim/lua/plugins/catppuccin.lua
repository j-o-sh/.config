return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    transparent_background = true,
    highlight_overrides = {
      all = function(colors)
        return {
          LineNr = { fg = colors.overlay1 },
        }
      end,
    },
    integrations = {
      barbecue = {
        dim_dirname = true, -- directory name is dimmed by default
        bold_basename = true,
        dim_context = false,
        alt_background = false,
      },
      cmp = true,
      dashboard = true,
      fidget = true,
      gitsigns = true,
      treesitter = true,
      notify = true,
      markdown = true,
      mason = true,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      neogit = true,
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  },
}
