return {
  { 'nvim-mini/mini.icons', version = '*', opts = true },
  { 'nvim-mini/mini.extra', version = '*', opts = true },
  { 'nvim-mini/mini.cmdline', version = '*', opts = true },
  { 'nvim-mini/mini.surround', version = '*', opts = true },
  { 'nvim-mini/mini.pairs', version = '*', opts = true },
  {
    "echasnovski/mini.pick",
    version = "*",
    config = function()
      require("mini.pick").setup({
          window = {
            config = function()
              local height = math.floor(0.618 * vim.o.lines)
              local width = math.floor(0.618 * vim.o.columns)
              return {
                anchor = 'NW', height = height, width = width,
                row = math.floor(0.5 * (vim.o.lines - height)),
                col = math.floor(0.5 * (vim.o.columns - width)),
              }
            end,
          },
        })

        -- Set up keymaps
        vim.keymap.set("n", "<leader>ff", function()
          require("mini.pick").builtin.files()
        end, { desc = "Find files" })

        vim.keymap.set("n", "<leader>fb", function()
          require("mini.pick").builtin.buffers()
        end, { desc = "Find buffers" })
      end,
    },
  {
    'nvim-mini/mini.indentscope',
    version = '*',
    event = "BufReadPre",
    opts = {
      symbol = "┊",
    },
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", {
        fg = "#45475a",  -- foreground color
        bg = "NONE",     -- transparent background
        nocombine = true,
      })
    end,
  },
}
