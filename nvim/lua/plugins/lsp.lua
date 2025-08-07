return {
  -- LSP Pluginss
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/which-key.nvim",
      { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
      "williamboman/mason-lspconfig.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local wk = require("which-key")
      local lspcfg = require("lspconfig")

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          wk.add({
            { "<leader>c", group = "[c]ode" },
            { "<leader>f", group = "[f]ind" },
            { "<leader>g", group = "[g]oto" },
            { "<leader>i", group = "[i]nfo" },
          })
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
          end

          map("gd", require("telescope.builtin").lsp_definitions, "[g]oto [d]efinition")
          map("gr", require("telescope.builtin").lsp_references, "[g]oto [r]eferences")
          map("gI", require("telescope.builtin").lsp_implementations, "[g]oto [i]mplementation")
          map("<leader>gD", require("telescope.builtin").lsp_type_definitions, "[g]oto type [D]efinition")
          map("<leader>fS", require("telescope.builtin").lsp_document_symbols, "[f]ind [S]ymbols")
          map("<leader>fs", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[f]ind workspace [s]ymbols")
          map("<leader>cr", vim.lsp.buf.rename, "[c]ode [r]ename")
          map("<leader>ca", vim.lsp.buf.code_action, "[c]ode [a]ction", { "n", "x" })

          map("<leader>id", vim.diagnostic.open_float, "[i]nfo [d]iagnostics")
          map("<leader>iD", vim.diagnostic.setqflist, "[i]nfo [D]iagnostics in a quickfix list")
          map("<leader>ih", vim.lsp.buf.hover, "[i]nfo on [h]over")
          map("<leader>is", vim.lsp.buf.hover, "[i]nfo on [s]ignature help")
        end,
      })

      if vim.g.have_nerd_font then
        local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
        local diagnostic_signs = {}
        for type, icon in pairs(signs) do
          diagnostic_signs[vim.diagnostic.severity[type]] = icon
        end
        vim.diagnostic.config({ signs = { text = diagnostic_signs } })
      end

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      local servers = {
        cssls = {},
        gopls = {},
        html = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        sourcekit = {
          root_dir = lspcfg.util.root_pattern(".git", "Package.swift", "compile_commands.json"),
        },
        vtsls = {},
        vue_ls = {}
      }

      lspcfg.clangd.setup {
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp" }, -- Only attach to C/C++
        root_dir = lspcfg.util.root_pattern("CMakeLists.txt", ".git"),
      }
      lspcfg.sourcekit.setup {
        filetypes = { "swift", "objective-c", "objective-cpp" },
        root_dir = lspcfg.util.root_pattern("Package.swift", ".git"),
      }

      local vue_language_server_path = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
      local vue_plugin = {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
        configNamespace = 'typescript',
      }
      local vtsls_config = {
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                vue_plugin,
              },
            },
          },
        },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      }
      local vue_ls_config = {}

      vim.lsp.config('vtsls', vtsls_config)
      vim.lsp.config('vue_ls', vue_ls_config)
      vim.lsp.enable({'vtsls', 'vue_ls'})

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "vue",
        callback = function()
          vim.opt_local.backupcopy = "yes"
        end,
      })


      require("mason").setup()
      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            lspcfg[server_name].setup(server)
          end,
        },
        ensure_installed = {},
        automatic_installation = true,
      })
    end,
  },
}
