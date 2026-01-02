return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 1. Suggestions auto-open or get opened on demand via <C-Space>
      -- 2. Tab and S-Tab select in a suggestion menu
      -- 3. Enter confirms but ONLY if a suggestion has been selected.
      keymap = {
        preset = 'none',

        ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },

        ['<Tab>'] = {
          function(cmp)
            local list = require('blink.cmp.completion.list')
            if cmp.snippet_active() then
              return cmp.snippet_forward()
            end
            if cmp.is_visible() then
              if #list.items == 1 then
                -- TODO this _may_ annoy me. Let's test.
                vim.schedule(function() list.accept({ index = 1 }) end)
                return true
              else
                print(list.selected_item_idx)
                return cmp.select_next()
              end
            end
            return false
          end,
          'fallback',
        },

        ['<S-Tab>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.snippet_backward()
            end
            if cmp.is_visible() then
              return cmp.select_prev()
            end
            return false
          end,
          'fallback',
        },

        ['<CR>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.snippet_forward()
            end
            -- WARN this is what I want but it may break as it is internal api!
            if cmp.is_visible() and require('blink.cmp.completion.list').is_explicitly_selected then
              return cmp.accept()
            end

            -- 3. otherwise behave like normal Enter
            return false
          end,
          'fallback',
        },

        ['<Esc>'] = {
          function(cmp)
            if cmp.is_visible() and require('blink.cmp.completion.list').is_explicitly_selected then
              return cmp.cancel()
            end
          end,
          'fallback',
        }
      },
      appearance = {
        nerd_font_variant = 'mono'
      },

      completion = {
        documentation = { auto_show = false },
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          }
        }
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
}
