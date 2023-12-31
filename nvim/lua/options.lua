return {
  apperance = {
    colorscheme = 'gruvbox',
    number = true,
  },

  vim = {
    relativenumber = true,
    breakindent = true,
    wrap = true,
    tabstop = 2,
    softtabstop = 2,
    shiftwidth = 2,
    expandtab = true,
    incsearch = true,
    scrolloff = 8,

    foldlevel = 666,
    foldmethod = 'indent'
  },

  keys = {
    leader = ' ',
    normal = {
      movelineUp = 'm',
      movelineDown = 'n',

      findfiles = '<leader>ff',
      grepfiles = '<leader>fg',
      findbuffers = '<leader>fb',
      findhelp = '<leader>fh'
    }

    -- Explore files 
    -- Find files
    -- Grep in files
  }
}

