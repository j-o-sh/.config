return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "pug",
      "query",
      "vim",
      "vimdoc",
    },
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { "ruby", "pug" },
    },
    indent = {
      enable = true,
      disable = { "ruby", "html" },
    },
  },
  init = function ()
    vim.treesitter.language.register('pug', 'pug')
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "pug",
      callback = function()
        vim.treesitter.start() -- attaches TS for this buffer
      end,
    })
  end
}
