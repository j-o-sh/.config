return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      -- theme = "catppuccin",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      globalstatus = true,
      log_level = "debug",
    },
    sections = {
      lualine_a = {
        {
          "filetype",
          icon_only = true,
          colored = false,
          padding = { left = 1 },
          separator = { left = "" },
        },
        {
          "filename",
          symbols = {
            modified = "",
            readonly = "",
            unnamed = "",
            newfile = "",
          },
        },
      },
      lualine_b = { "location" },
      lualine_c = { "diagnostics" },
      lualine_x = { "searchcount", "selectioncount" },
      lualine_z = {},
      lualine_y = {
        { "branch" },
        { "diff" },
        { "lsp_status" },
        {
          'mode',
          fmt = function(str)
            local s = str:sub(1, 1)
            return s == "N" and "󰸼"
                or s == "V" and "󰆽"
                or s == "I" and "󰙏"
                or s == "C" and ""
                or s
          end,
          separator = { right = '' }
        },
      },
    },
    extensions = {
      'quickfix', 'oil'
    }
  },
}
