# Key Schema

Figuring out a good key mapping scheme.

## Implementation

* `<leader>`
* - [C]ode | [L]sp | ...
* - - [D]iagnostics

```js
{
  '<leader>': {
    'd': ['show [d]iagnostics', 'vim.diagnostics.open_float'],
    'l': ['[L]anguage ...', {
      'd'
    }]
  }
}
```

## Reference

Here's a table:

| Funktion | Plugin | Command | Keybind |
|----------|--------|---------|---------|
| Open Plugin Manager | Lazy   | `:Lazy` |         |
| | nvim-fugitive | | |
| | nvim-rhubarb | | |
| | nvim-sleuth | | |
| | nvim-lspconfig | vim.diagnostic.open_float | |
| | nvim-lspconfig | vim.diagnostic.goto_prev | |
| | nvim-lspconfig | vim.diagnostic.goto_next | |
| | nvim-lspconfig | vim.diagnostic.gsetloclist | |
| Omnifunc | nvim-lspconfig | `vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'` | `<c-x><c-o>` |
| Declaration | nvim-lspconfig |  | |
| Definition | nvim-lspconfig | | |
| Hover | nvim-lspconfig | | |
| Implementation | nvim-lspconfig | | |
| Signature Help | nvim-lspconfig | | |
| Add Workspace Folder | nvim-lspconfig | | |
| Remove Workspace Folder | nvim-lspconfig | | |
| List Workspace Folders | nvim-lspconfig | | |
| Type Definition | nvim-lspconfig | | |
| Rename | nvim-lspconfig | | |
| Code Action | nvim-lspconfig | | |
| References | nvim-lspconfig | | |
| Auto Format | nvim-lspconfig | | |



