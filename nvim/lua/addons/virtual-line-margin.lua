local ns = vim.api.nvim_create_namespace("virtual_colorcolumn")

return function()
  vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "TextChanged", "CursorMoved" }, {
    callback = function()
      -- Only run for normal buffers
      local bt = vim.bo.buftype
      if bt ~= "" then
        return
      end

      local ft = vim.bo.filetype
      if vim.tbl_contains({ "alpha", "help", "lazy", "TelescopePrompt", "neo-tree" }, ft) then
        return
      end

      vim.api.nvim_buf_clear_namespace(0, ns, 0, -1) -- clear old markers

      local lines = vim.api.nvim_buf_line_count(0)
      for i = 0, lines - 1 do
        local text = vim.api.nvim_buf_get_lines(0, i, i + 1, false)[1]
        local textlen = vim.fn.strdisplaywidth(text or "")

        if textlen < 80 then
          local padding = string.rep(" ", 80 - textlen - 1)
          vim.api.nvim_buf_set_extmark(0, ns, i, 0, {
            virt_text = { { padding .. "▏", "VirtualColorColumn" } },
            virt_text_pos = "eol",
            hl_mode = "combine",
          })
        end
      end
    end,
  })

  -- Optional: set highlight group
  vim.api.nvim_set_hl(0, "VirtualColorColumn", { fg = "#5c6370", nocombine = true })
end
