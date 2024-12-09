return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      "nvim-telescope/telescope-fzf-native.nvim",

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = "make",

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    "folke/which-key.nvim",
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  -- TODO: Why is this a function? can I not get this into the Lazy manager style?
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
  end,
  init = function()
    local wk = require("which-key")
    local builtin = require("telescope.builtin")

    wk.add({
      { "<leader>f", group = "+[f]ind" },
      { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "[f]ind [f]iles" },
      { "<leader>fW", builtin.grep_string, desc = "[f]ind the current [W]ord" },
      { "<leader>fw", builtin.live_grep, desc = "[f]ind some [w]ords" },
      { "<leader>fb", "<CMD>Telescope buffers<CR>", desc = "[f]ind in [b]uffers" },
      { "<leader>fB", builtin.current_buffer_fuzzy_find, desc = "[f]ind in current [B]uffer" },
      { "<leader>fg", builtin.git_files, desc = "[f]ind in [g]it files" },
      { "<leader>fq", builtin.quickfix, desc = "[f]ind in [q]uickfix list" },
    })
  end,
}
