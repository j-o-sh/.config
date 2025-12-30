return function()
  -- local ok, wk = pcall(require, "which-key")
  -- if ok then wk.add({{"<leaader>s", group = "[S]plit buffer"}}) end

  vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split horizontally" })
  vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" })
  vim.keymap.set("n", "<leader>ws", "<C-w>w", { desc = "Switch active window" })
  vim.keymap.set("n", "<leader>wS", "<C-w>W", { desc = "Switch active window backwards" })
  vim.keymap.set("n", "<leader>wx", "<C-w>x", { desc = "Exchange current with next window" })
  vim.keymap.set("n", "<leader>wc", "<cmd>only<CR>", { desc = "Close other windows" })

  vim.keymap.set("n", "<leader>j", "<C-d>zz", { desc = "Half page down + center" })
  vim.keymap.set("n", "<leader>k", "<C-u>zz", { desc = "Half page up + center" })

  vim.keymap.set('n', 'q', '<Nop>')
end
