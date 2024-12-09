return {
  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  -- { 'Bilal2453/luvit-meta', lazy = true },
  {
    -- Main LSP Configuration
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/which-key.nvim",
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
      "williamboman/mason-lspconfig.nvim",
      -- "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { "j-hui/fidget.nvim", opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local wk = require("which-key")
      local lspcfg = require("lspconfig")

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
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

      -- Change diagnostic symbols in the sign column (gutter)
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

      local function vueTsPluginLocation()
        local mason_registry = require("mason-registry")
        local ts_plugin_path = mason_registry.get_package("vue-language-server"):get_install_path()
          .. "/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin"

        return ts_plugin_path
      end

      -- Enable the following language servers
      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
      local servers = {
        cssls = {},
        gopls = {},
        html = {},
        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
        sourcekit = {
          root_dir = lspcfg.util.root_pattern(".git", "Package.swift", "compile_commands.json"),
        },
        ts_ls = {
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vueTsPluginLocation(),
                languages = { "vue", "typescript", "javascript" },
              },
            },
          },
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        },
        volar = {},
      }

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
