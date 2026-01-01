return {
  { 'nvim-mini/mini.icons',   version = '*', opts = true },
  { 'nvim-mini/mini.extra',   version = '*', opts = true },
  { 'nvim-mini/mini.cmdline', version = '*', opts = {
    autocorrect = { enable = false },
  } },

  {
    "echasnovski/mini.pick",
    version = "*",
    opts = {
      window = {
        config = function()
          local height = math.floor(0.618 * vim.o.lines)
          local width = math.floor(0.618 * vim.o.columns)
          return {
            anchor = 'NW',
            height = height,
            width = width,
            row = math.floor(0.5 * (vim.o.lines - height)),
            col = math.floor(0.5 * (vim.o.columns - width)),
          }
        end,
      },
    },
    keys = {
      { "<leader>ff", function() require("mini.pick").builtin.files() end,     desc = "[f]ind [f]iles" },
      { "<leader>fb", function() require("mini.pick").builtin.buffers() end,   desc = "[f]ind [b]uffers" },
      { "<leader>fp", function() require("mini.pick").builtin.grep_live() end, desc = "[f]ind [p]attern" },
    },
    init = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-pick-maps", { clear = true }),
        callback = function(ev)
          local buf = ev.buf
          local key = function(key, scope, desc)
            vim.keymap.set(
              "n",
              "<leader>l" .. key,
              "<cmd>Pick lsp scope='" .. scope .. "'<cr>",
              { desc = desc, buffer = buf }
            )
          end

          key('D', 'declaration', "[l]sp: pick [D]eclarations")
          key('d', 'definition', "[l]sp: pick [d]efinitions")
          key('t', 'type_definition', "[l]sp: pick [t]ype definitions")
          key('i', 'implementation', '[l]sp: pick [i]mplmentations')
          key('r', 'references', '[l]sp: pick [r]eferences')
          key('s', 'document_symbol', "[l]sp: pick [s]ymbols in document")
          key('S', 'workspace_symbol_live', "[l]sp: pick [S]ymbols in workspace")
        end,
      })
    end
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
        fg = "#45475a", -- foreground color
        bg = "NONE",    -- transparent background
        nocombine = true,
      })
    end,
  },
}
