return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'catppuccin',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        {'filetype', icon_only = true, colored = false, padding = { left = 1 }},
        {'filename', symbols = {
          modified = '',
          readonly = '',
          unnamed = '',
          newfile = ''
        },
      }},
      lualine_b = {'location', 'diagnostics'},
      lualine_c = {},
      lualine_x = {'searchcount', 'selectioncount'},
      lualine_z = {},
      lualine_y = {'branch', 'diff'},
    }
  }
}
