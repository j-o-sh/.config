return function()
  local wk = require("which-key")

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

  -- Create commands for easy access
  vim.api.nvim_create_user_command("BufOnly", CloseOtherBuffers, {})
  vim.api.nvim_create_user_command("BufOnlyForce", ForceCloseOtherBuffers, {})

  wk.add({
    { "<leader>b", group = "[b]uffers" },
    { "<leader>bo", "<CMD>BufOnly<CR>", desc = "[b]uffers: close [o]ther buffers" },
    { "<leader>bO", "<CMD>BufOnlyForce<CR>", desc = "[b]uffers: Force close [O]ther buffers!" },
    { "<leader>bs", "<C-^>", desc = "[b]uffers: [S]witch to last buffer" },
    { "<leader>bn", "<cmd>bnext<CR>", desc = "[b]uffers: switch to next buffer" },
    { "<leader>bp", "<cmd>bprev<CR>", desc = "[b]uffers: switch to previous buffer" },
  })
end
