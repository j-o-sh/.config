local cmp = require('cmp')
return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
  },
  opts = {
    snippet = {
      -- expand = function(args)
      expand = function()
      end,
    },

    -- completion = {
    --   completeopt = 'menu,menuone,noinsert',
    -- },

    mapping = cmp.mapping.preset.insert({

      -- Safely select entries with <CR>
      -- If nothing is selected (including preselections) add a newline as usual.
      -- If something has explicitly been selected by the user, select it.
      -- ['<CR>'] = {
      --   i = function(fallback)
      --     print('Wut?')
      --     if cmp.visible() and cmp.get_active_entry() then
      --       cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
      --     else
      --       fallback()
      --     end
      --   end,
      --   s = cmp.mapping.confirm({ select = true }),
      --   c = cmp.mapping.confirm({
      --     behavior = cmp.ConfirmBehavior.Replace,
      --     select = true
      --   }),
      -- },
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        -- elseif luasnip.expand_or_locally_jumpable() then
        --   luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        -- elseif luasnip.locally_jumpable(-1) then
        --   luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp'},
      { name = 'buffer' },
    }),
  }
}
