local function mapkey(sequence, command, description)
  vim.keymap.set("n", "<leader>" .. sequence, command, { desc = description })
end

return function()
  -- We don't like macros here!
  vim.keymap.set('n', 'q', '<Nop>')

  mapkey("wh", "<C-w>s", "Split [h]orizontally")
  mapkey("wv", "<C-w>v", "Split [v]ertically")
  mapkey("ws", "<C-w>w", "[s]witch active window")
  mapkey("wS", "<C-w>W", "[S]witch active window backwards")
  mapkey("wx", "<C-w>x", "E[x]change current with next window")
  mapkey("wc", "<cmd>close<CR>", "[c]lose this window")
  mapkey("wC", "<cmd>only<CR>", "[C]lose other windows")

  mapkey("j", "<C-d>zz", "Half page down + center")
  mapkey("k", "<C-u>zz", "Half page up + center")


  mapkey("cd", vim.diagnostic.open_float, "[c]ode [d]iagnostics")
  -- LSP Keys
  -- mapkey()

end
