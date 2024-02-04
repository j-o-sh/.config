-- "gc" to comment visual regions/lines
-- TODO complete keybindings
-- TODO load keybindings from keymam in options
return  { 
   "numToStr/Comment.nvim",
   opts = {
     toggler = { line = '<leader>gc', block = '<leader>gb' }
   },
   lazy = false
}

