return function()
  local ok, wk = pcall(require, "which-key")
  if ok then wk.add({{"<leaader>s", group = "[S]plit buffer"}}) end

  vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
  vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
  vim.keymap.set("n", "<leader>ss", "<C-w>w", { desc = "Switch active window" })
  vim.keymap.set("n", "<leader>sS", "<C-w>W", { desc = "Switch active window backwards" })
  vim.keymap.set("n", "<leader>sx", "<C-w>x", { desc = "Exchange current with next window" })
  vim.keymap.set("n", "<leader>sc", "<cmd>only<CR>", { desc = "Close other windows" })

  vim.keymap.set("n", "<leader>j", "<C-d>zz", { desc = "Half page down + center" })
  vim.keymap.set("n", "<leader>k", "<C-u>zz", { desc = "Half page up + center" })
end
