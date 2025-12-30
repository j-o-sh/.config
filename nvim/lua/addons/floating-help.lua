return function()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    callback = function()
      local buf = vim.api.nvim_get_current_buf()

      -- Close the original window
      vim.cmd("wincmd c")

      local width = math.min(120, math.floor(vim.o.columns * 0.8))
      local height = math.min(50, math.floor(vim.o.lines * 0.8))

      local row = math.floor((vim.o.lines - height) / 2)
      local col = math.floor((vim.o.columns - width) / 2)

      local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        row = row,
        col = col,
        width = width,
        height = height,
        style = "minimal",
        border = "rounded",
      })

      -- Close with ESC
      vim.keymap.set("n", "<Esc>", function()
        if vim.api.nvim_win_is_valid(win) then
          vim.api.nvim_win_close(win, true)
        end
      end, { buffer = buf, silent = true })
    end,
  })

end
