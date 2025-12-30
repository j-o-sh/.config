local flash = function (method)
  return function()
    require("flash")[method]()
  end
end

return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  keys = {
    { "s", mode = { "n", "x", "o" }, flash("jump"), desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, flash("treesitter"), desc = "Flash Treesitter" },
    { "<c-s>", mode = { "c" }, flash("toggle"), desc = "Toggle Flash Search" },
  },
}
