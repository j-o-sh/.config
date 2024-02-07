local ut = require('utils').tables

local treesitter = {
  textobjects = {
    ['aa'] = '@parameter.outer',
    ['ia'] = '@parameter.inner',
    ['af'] = '@function.outer',
    ['if'] = '@function.inner',
    ['ac'] = '@class.outer',
    ['ic'] = '@class.inner',
  },
  move = {
    goto_next_start = {
      [']f'] = '@function.outer',
      [']c'] = '@class.outer',
      [']b'] = '@block.outer',
    },
    goto_next_end = {
      [']F'] = '@function.outer',
      [']C'] = '@class.outer',
      [']B'] = '@block.outer',
    },
    goto_previous_start = {
      ['[f'] = '@function.outer',
      ['[c'] = '@class.outer',
      ['[b'] = '@block.outer',
    },
    goto_previous_end = {
      ['[F'] = '@function.outer',
      ['[C'] = '@class.outer',
      ['[B'] = '@block.outer',
    },
  },
  swap = {
    swap_next = {
      ['<leader>a'] = '@parameter.inner',
    },
    swap_previous = {
      ['<leader>A'] = '@parameter.inner',
    },
  },
}

local groups = {
  [ 'treesitter.incremental_selection' ] = {
    name = '[S]eeeeelect...',
    prefix = '<leader>',
    key = 's',

    i = { '[I]nit Selection', 'init_selection' },
    n = { 'Add [N]ode', 'node_incremental' },
    s = { 'Add [S]cope', 'scope_incremental' },
  },
  [ 'treesitter.lsp_interop.peek_definition_code' ] = {
    name = '[P]eek definition...',
    prefix = '<leader>',
    key = 'p',

    f = {'[P]eek [F]unction', '@function.outer'},
    c = {'[Peek] [C]lass', '@class.outer'},
  }
}

local kpairs = function(group)
  local meta = ut({ 'prefix', 'key', 'name' })
  return function (_, key)
    local k = key 
    local v
    repeat
      k, v = next(group, k)
      if not meta.includes(k) then return k, v end
    until k == nil
  end
end

-- finds a group with the given id and returns its keys as
-- { [ g[2] ] = prefix .. key .. keyvalue, ... }
-- e.g. { 'foo' = { prefix = '<x>', key = 'k', v = [ 'Description', 'command' ] } }
-- will be returned as { ['command'] = '<x>kv' }
local commandKeys = function(id)
  local g = groups[id]
  local commands = {}
  for k, v in kpairs(g) do
    commands[v[2]] = g.prefix .. g.key .. k
  end
  return commands
end

local keys = {
  leader = ' ',
  groups = groups,
  kpairs = kpairs,
  cmdKeys = commandKeys,
}
return keys

