return {
  "olimorris/codecompanion.nvim",
  dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
      { "nvim-treesitter/nvim-treesitter" }
  },
  version = "^19.0.0",
  opts = {
    display = {
      chat = {
        window = {
          layout = "buffer",
        },
      },
    },
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)
    -- vim.keymap.set(
    --   "n", 
    --   "<leader>ac", 
    --   "<cmd>CodeCompanionChat Toggle<cr>", 
    --   { desc = "Toggle [a]i [c]hat" }
    -- )
    vim.keymap.set("n", "<leader>ac", function()
      -- 1. Skip window creation if we're already open
      if vim.bo.filetype ~= "codecompanion" then
        -- 2. If only one normal window, create a right split and return focus
        local normal_wins = vim.tbl_filter(function(w)
          return vim.api.nvim_win_get_config(w).relative == ""
        end, vim.api.nvim_tabpage_list_wins(0))

        if #normal_wins == 1 then
          vim.cmd("botright vnew")
          vim.cmd("wincmd p") -- go back to original window
        end

        -- 3. Switch to next window
        vim.cmd("wincmd w")
      end

      -- 4. Toggle the chat
      vim.cmd("CodeCompanionChat Toggle")

      -- 5. If current window now has an empty unnamed buffer, close it
     local buf = vim.api.nvim_get_current_buf()
      if vim.api.nvim_buf_get_name(buf) == ""
        and not vim.bo[buf].modified
        and vim.bo[buf].buftype == ""
        and vim.bo[buf].filetype == "" then
        local normal_wins = vim.tbl_filter(function(w)
          return vim.api.nvim_win_get_config(w).relative == ""
        end, vim.api.nvim_tabpage_list_wins(0))
        if #normal_wins > 1 then
          vim.api.nvim_win_close(0, false)
        end
      end

      -- 6. Return focus to the code window after closing
      if vim.bo.filetype ~= "codecompanion" then
        vim.cmd("wincmd p")
      end
    end, { desc = "Toggle [a]i [c]hat in other window" })
  end,
}
