return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
      local a = require'alpha.themes.dashboard'
      local artfilename = vim.fn.stdpath('config') .. '/art.txt'
      local artfile = io.open(artfilename, 'r')
      if artfile then
        local lines = {}
        for line in artfile:lines() do
          table.insert(lines, line)
        end
        artfile:close()
        a.section.header.val = lines
      end

      return a.config
    end
}

