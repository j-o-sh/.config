return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  init =  function()
    local harpoon = require('harpoon')
    local wk = require("which-key")

    harpoon:setup({})

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    local function add_all_buffers()
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
          local bufname = vim.api.nvim_buf_get_name(buf)
          if bufname ~= "" then
            harpoon:list():add({ value = bufname })
          end
        end
      end
    end

    wk.add({
      { "<leader>h", group = "[h]arpoon..." },
      { "<leader>ha", function() harpoon:list():add() end, desc = "[h]arpoon [a]dd"},
      { "<leader>hc", function() harpoon:list():clear() end, desc = "[h]arpoon [c]lear"},
      { "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "[h]arpoon [l]ist"},
      { "<leader>ht", function() toggle_telescope(harpoon:list()) end, desc = "[h]arpoon list in [t]elescope"},

      { "<leader>hb", function() add_all_buffers() end, desc = "[h]arpoon add all [b]uffers"},
      { "<leader>hB", function() harpoon:list():clear() add_all_buffers() end, desc = "[h]arpoon exchange list with all [B]uffers"},

      { "<leader>h1", function() harpoon:list():select(1) end, desc = "[h]arpoon select 1"},
      { "<leader>h2", function() harpoon:list():select(2) end, desc = "[h]arpoon select 2"},
      { "<leader>h3", function() harpoon:list():select(3) end, desc = "[h]arpoon select 3"},
      { "<leader>h4", function() harpoon:list():select(4) end, desc = "[h]arpoon select 4"},
      { "<leader>h5", function() harpoon:list():select(5) end, desc = "[h]arpoon select 5"},

      { "<leader>hp", function() harpoon:list():prev() end, desc = "[h]arpoon previous"},
      { "<leader>hn", function() harpoon:list():next() end, desc = "[h]arpoon next"},
    })
  end
}
