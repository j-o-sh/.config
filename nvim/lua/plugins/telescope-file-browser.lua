return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'folke/which-key.nvim',
  },
  init = function()
    -- You don't need to set any of these options.
    -- IMPORTANT!: this is only a showcase of how you can set default options!
    require('telescope').setup {
      extensions = {
        file_browser = {
          -- theme = 'ivy',
          -- disables netrw and use telescope-file-browser in its place
          -- hijack_netrw = true,
          -- mappings = {
          --   ["i"] = {
          --     -- your custom insert mode mappings
          --   },
          --   ["n"] = {
          --     -- your custom normal mode mappings
          --   },
          -- },
        },
      },
    }
    -- To get telescope-file-browser loaded and working with telescope,
    -- you need to call load_extension, somewhere after setup function:
    require("telescope").load_extension "file_browser"

    local wk = require 'which-key'
    wk.add({
      {
        '<leader>fe',
        '<cmd>:Telescope file_browser<cr>',
        desc = '[f]ind by [e]xploring pwd'
      },
      {
        '<leader>fE',
        '<cmd>:Telescope file_browser path=%:p:h select_buffer=true<cr>',
        desc = '[f]ind by [E]xploring the current dir'
      },
    })
  end
}
