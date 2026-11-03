return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim", branch = "master" },
    { "nvim-treesitter/nvim-treesitter" }
  },
  version = "^19.0.0",
  opts = {
    adapters = {
      http = {
        blackpearl = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "http://blackpearl.local:12345",
              api_key = "5086b8e5-1ed7-4e68-be23-e70210da5d47",
              chat_url = "/v1/chat/completions",
            },
          })
        end,
      },
    },
    display = {
      chat = {
        window = {
          layout = "float",
          width = 0.8,
          height = 0.8,
        }
      },
    },
    interactions = {
      chat = { adapter = "blackpearl", },
      inline = { adapter = "blackpearl", },
    },
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)
    vim.keymap.set(
      "n", 
      "<leader>ac", 
      "<cmd>CodeCompanionChat Toggle<cr>", 
      { desc = "Toggle [a]i [c]hat" }
    )
  end,
}
