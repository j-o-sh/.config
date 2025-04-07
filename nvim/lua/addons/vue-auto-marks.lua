return function()
  vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*.vue",
    callback = function()
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

      local function set_mark(letter, pattern)
        for i, line in ipairs(lines) do
          if line:match(pattern) then
            vim.api.nvim_buf_set_mark(0, letter, i, 0, {})
            break
          end
        end
      end

      set_mark("s", "<script") -- Mark 's' for script
      set_mark("t", "<template") -- Mark 't' for template
      set_mark("y", "<style") -- Mark 'y' for style
    end,
  })
end
