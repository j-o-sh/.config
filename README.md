# Joshs .config

## Neovim

Custom setup, loosely based on the [Kickstart NVIM](https://github.com/nvim-lua/kickstart.nvim) configuration.

It starts with `init.lua`.


### Dependencies

These are the gathered dependencies to be able to run everything in Neovim (LSPs and stuff).

* wget
* cargo (rust)


### Directory Structure

### Plugins

We are using the [Lazy](https://github.com/folke/lazy.nvim) plugin manager.

What follows is a list of all the plugins I use and a short description so that I remember what they are for.

#### Vim-Sleuth

[Vim-sleuth](https://github.com/tpope/vim-sleuth) enables vim to determine tabstops based on the current file.


#### Nvim Lspconfig

[Lspconfig](https://github.com/neovim/nvim-lspconfig) is a Neovim plugin that simplifies the configuration of Language Server Protocol (LSP) clients in Neovim. It provides a straightforward way to set up and manage LSP clients for various programming languages.

In a more concise overview, `nvim-lspconfig`:

- Simplifies LSP configuration: It abstracts away the complexity of manually configuring LSP clients in Neovim.

- Provides easy setup: It offers pre-defined configurations for popular programming languages, making it simple to get started with LSP.

- Offers customization options: It allows users to customize the behavior of LSP clients according to their preferences and specific project requirements.

- Supports various LSP servers: It supports a wide range of language servers, enabling Neovim to provide language-specific features like code completion, diagnostics, and documentation.

By using `nvim-lspconfig`, Neovim users can quickly set up and benefit from the capabilities of LSP, enhancing their coding experience with advanced language-specific features.


#### Nvim Fidget

[Figet](https://github.com/j-hui/fidget.nvim) is a simple UI for presenting LSP progress.


#### Neodev

[Neodev.nvim](https://github.com/folke/neodev.nvim) is a Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.

#### Mason and Mason/Lspconfig

[Mason](https://github.com/williamboman/mason.nvim) is basically an LSP package manager and allows (together with [Mason-LspConfig](https://github.com/williamboman/mason-lspconfig.nvim) for an automagic setup of LSPs for new languages.


#### Lualine

[Nvim-Lualine](https://github.com/nvim-lualine/lualine.nvim) is a blazing fast and easy to configure Neovim statusline written in Lua. (or so they say in their docs at least...)


#### Comment.nvim

The [Comment](https://github.com/numToStr/Comment.nvim) plugin is a simple code commenting tool.

* `gcc` to comment or uncomment a line


#### Telescope

The [Telescope](https://github.com/nvim-telescope/telescope.nvim) Fuzzy Finder.

Notes:

 - `leader ff` - find files
 - `leader fg` - grep in working directory

> Uses [ripgrep](https://github.com/BurntSushi/ripgrep#installation) for the Grep part (`<leader> fg`)

#### Treesitter

[Nvim Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) provides Treesitter for Nvim.

Treesitter is a code structure module. Basically somewhat LSP-like


### Unused but interesting Plugins

I am trying to get a sense of the ecosystem. So I will not actively use a plugin unless I understand it's usecase. However I want a place to remind myself of interesting ones.

This is that space.

* [Fugitive](https://github.com/tpope/vim-fugitive) - a GIT plugin
* [Rhubarb](https://github.com/tpope/vim-rhubarb) - a GITHub plugin


### Keymaps



