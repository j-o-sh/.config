return {
  -- TODO: add lua-line
  -- TODO: Better Command line
  {
    "folke/twilight.nvim",
    opts = {
      dimming = { alpha = 0.4 },
      inactive = true,
      expand = {
        "function",
        "method",
        "table",
      },
    },
    keys = {
      { "<leader>z", "<cmd>Twilight<cr>", desc = "toggle [z]en mode" },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "catppuccin",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          { "filetype", icon_only = true, colored = false, padding = { left = 1 } },
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
        lualine_b = { "location", "diagnostics" },
        lualine_c = {},
        lualine_x = { "searchcount", "selectioncount" },
        lualine_z = {},
        lualine_y = { "branch", "diff" },
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      messages = {
        enabled = false,
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = false, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
      "hrsh7th/nvim-cmp",
    },
  },
}
