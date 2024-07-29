local function first_contained(datalist, items)
  for _, i in ipairs(datalist) do
    for _, j in ipairs(items) do
      if i == j then return i end
    end
  end
end

local function browse_git_changes()
  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local conf = require('telescope.config').values

  local current_branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD")[1]
  local branches = vim.fn.systemlist("git branch --format='%(refname:short)'")
  local base = first_contained(branches, {'dev', 'main', 'master'})
  local changed_files = vim.fn.systemlist("git diff --name-only " .. base .. " " .. current_branch)

  pickers.new({}, {
    prompt_title = 'Changed in current branch (to ' .. base .. ')',
    finder = finders.new_table {
      results = changed_files
    },
    sorter = conf.generic_sorter({})
  }):find()
end

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'folke/which-key.nvim',
  },
  init = function()
    local builtin = require('telescope.builtin')
    local wk = require('which-key')

    wk.add({
      { '<leader>f', group = '+[f]ind' },
      { '<leader>ff', builtin.find_files, desc = '[f]ind [f]iles' },
      { '<leader>fg', builtin.live_grep, desc = '[f]ind by [g]rep' },
      { '<leader>fb', builtin.buffers, desc = '[f]ind in [b]uffers' },
      { '<leader>fh', builtin.help_tags, desc = '[f]ind in [h]elp tags' },

      { '<leader>fc', browse_git_changes, desc = '[f]ind git [c]hanged files' },
    })
  end
}
