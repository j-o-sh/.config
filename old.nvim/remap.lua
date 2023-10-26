vim.g.mapleader = " "
vim.keymap.set("n", "<leader>p", vim.cmd.Ex)
vim.keymap.set("n", "<leader>m", ":move +1<cr>")
vim.keymap.set("n", "<leader>n", ":move -2<cr>")


-- Telescope Bindings --
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
vim.keymap.set('n', '<leader>fs', function() telescope.grep_string({ search = vim.fn.input("?>") }) end)

-- LSP Bindings --
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- ZEN Mode --
vim.keymap.set('n', '<leader>z', ':TZAtaraxis')

