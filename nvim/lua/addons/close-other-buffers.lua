return function()
  -- Function to close all buffers except the current one, keeping unsaved buffers
  function CloseOtherBuffers()
    local current_buf = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
        if not vim.api.nvim_buf_get_option(buf, "modified") then
          vim.api.nvim_buf_delete(buf, {})
        end
      end
    end
  end

  -- Function to force close all buffers except the current one, even with unsaved changes
  function ForceCloseOtherBuffers()
    local current_buf = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end

  function FloatCurrentBuffer()
    local current_buf = vim.api.nvim_get_current_buf()
    local origin_win = vim.api.nvim_get_current_win()
    local windows = vim.api.nvim_list_wins()

    -- Bail if this is literally the only window + buffer
    if #windows == 1 then
      local listed = vim.tbl_filter(function(buf)
        return vim.fn.buflisted(buf) == 1
      end, vim.api.nvim_list_bufs())

      if #listed <= 1 then
        vim.notify("Cannot float the only remaining buffer", vim.log.levels.WARN)
        return
      end
    end

    -- Try to swap origin window to alternate buffer
    local alt_buf = vim.fn.bufnr("#")

    local replaced_origin = false

    if
      alt_buf ~= -1
      and alt_buf ~= current_buf
      and vim.api.nvim_buf_is_valid(alt_buf)
      and vim.fn.buflisted(alt_buf) == 1
      then
        vim.api.nvim_win_set_buf(origin_win, alt_buf)
        replaced_origin = true
      end

      -- Create floating window with current buffer
      local width = math.floor(vim.o.columns * 0.85)
      local height = math.floor(vim.o.lines * 0.85)

      local row = math.floor((vim.o.lines - height) / 2)
      local col = math.floor((vim.o.columns - width) / 2)

      local float_win = vim.api.nvim_open_win(current_buf, true, {
        relative = "editor",
        style = "minimal",
        border = "rounded",
        width = width,
        height = height,
        row = row,
        col = col,
      })

      -- If origin window couldn't display another buffer,
      -- and there are still other windows around, close it
      if not replaced_origin then
        if vim.api.nvim_win_is_valid(origin_win) then
          local remaining_windows = vim.api.nvim_list_wins()

          if #remaining_windows > 1 then
            vim.api.nvim_win_close(origin_win, false)
          end
        end
      end

      -- ESC closes float
      vim.keymap.set("n", "<Esc>", function()
        if vim.api.nvim_win_is_valid(float_win) then
          vim.api.nvim_win_close(float_win, false)
        end
      end, {
      buffer = current_buf,
      nowait = true,
      silent = true,
      desc = "Close floating window",
    })
  end


  -- Create commands for easy access
  vim.api.nvim_create_user_command("BufOnly", CloseOtherBuffers, {})
  vim.api.nvim_create_user_command("BufOnlyForce", ForceCloseOtherBuffers, {})
  vim.api.nvim_create_user_command("BufFloat", FloatCurrentBuffer, {})

  local ok, wk = pcall(require, "which-key")
  if ok then wk.add({{"<leader>b", group = "[B]uffers"}}) end

  vim.keymap.set(
    "n",
    "<leader>bo",
    "<CMD>BufOnly<CR>",
    { desc = "[b]uffers: close [o]ther buffers" }
  )

  vim.keymap.set(
    "n",
    "<leader>bO",
    "<CMD>BufOnlyForce<CR>",
    { desc = "[b]uffers: Force close [O]ther buffers!" }
  )

  vim.keymap.set(
    "n",
    "<leader>bc",
    "<CMD>bd<CR>",
    { desc = "[b]uffers: close [c]urrent buffer" }
  )

  vim.keymap.set(
    "n",
    "<leader>bC",
    "<CMD>bd!<CR>",
    { desc = "[b]uffers: Force close [C]urrent buffer!" }
  )

  vim.keymap.set(
    "n",
    "<leader>bs",
    "<C-^>",
    { desc = "[b]uffers: [S]witch to last buffer" }
  )

  vim.keymap.set(
    "n",
    "<leader>bn",
    "<cmd>bnext<CR>",
    { desc = "[b]uffers: switch to next buffer" }
  )

  vim.keymap.set(
    "n",
    "<leader>bp",
    "<cmd>bprev<CR>",
    { desc = "[b]uffers: switch to previous buffer" }
  )

  vim.keymap.set(
    "n",
    "<leader>bf",
    "<CMD>BufFloat<CR>",
    { desc = "[b]uffers: pop into [f]loat" }
  )

end
