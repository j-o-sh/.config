return function()
  vim.lsp.config("sourcekit", {
    filetypes = { "swift", "objective-c", "objective-cpp" },
  })
  vim.lsp.enable("sourcekit")


  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-maps", { clear = true }),
    callback = function(ev)
      local buf = ev.buf
      local key = function(key, fn, desc)
        vim.keymap.set( "n", "<leader>l" .. key, fn, { desc = desc, buffer = buf })
      end

      key('a', vim.lsp.buf.code_action, "[l]sp: code [a]ction")
      key('f', vim.lsp.buf.format, "[l]sp: code [f]format")
      key('h', vim.lsp.buf.hover, "[l]sp: show [h]over documentation")
      key('H', vim.lsp.buf.signature_help, "[l]sp: show signature [H]elp")
      key('n', vim.lsp.buf.rename, "[l]sp: re[n]ame symbol")

      -- Defined in mini.pick:
      --
      -- key('D', 'declaration', "[l]sp: pick [D]eclarations")
      -- key('d', 'definition', "[l]sp: pick [d]efinitions")
      -- key('t', 'type_definition', "[l]sp: pick [t]ype definitions")
      -- key('i', 'implementation', '[l]sp: pick [i]mplmentations')
      -- key('r', 'references', '[l]sp: pick [r]eferences')
      -- key('s', 'document_symbol', "[l]sp: pick [s]ymbols in document")
      -- key('S', 'workspace_symbol_live', "[l]sp: pick [S]ymbols in workspace")
    end,
  })
end
