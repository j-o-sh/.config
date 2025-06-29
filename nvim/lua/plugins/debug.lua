return {
  { 
    "mfussenegger/nvim-dap",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function () 
      local dap = require('dap')
      dap.adapters.lldb = {
        type = 'executable',
        command = '/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap',
        name = 'lldb'
      }

      dap.configurations.c = {
        {
          name = "Launch file",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
          -- runInTerminal = true,
        },
        {
          name = "Attach to PID",
          type = "lldb",
          request = "attach",
          pid = function()
            return tonumber(vim.fn.input('PID to attach to: '))
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = true,
          args = {},
          -- runInTerminal = true,
        },
      }

      dap.configurations.swift = dap.configurations.c
      dap.configurations.cpp = dap.configurations.c

      -- Keybinds
      local wk = require("which-key")

      wk.add({ 
        { "<leader>d", group = "[d]ebug" },
        { "<leader>db", dap.toggle_breakpoint, desc = "toggle [d]ebug [b]reakpoint" },
        { "<leader>dr", dap.continue, desc = "[d]ebug [r]un" },
        { "<leader>dt", dap.terminate, desc = "[d]ebug [t]erminate" },
        { "<leader>di", dap.step_into, desc = "[d]ebug step [i]nto" },
        { "<leader>do", dap.step_over, desc = "[d]ebug step [o]ver" },
        { "<leader>dO", dap.step_out, desc = "[d]ebug step [O]ut" },
      })

    end,
  },
  -- {
  --   "igorlfs/nvim-dap-view",
  --   opts = {},
  -- },
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  --   config = function()
  --     local dap = require("dap")
  --     local dapui = require("dapui")
  --     dapui.setup()
  --     dap.listeners.after.event_initialized["dapui_config"] = function()
  --       dapui.open()
  --     end
  --   end,
  -- },
}
