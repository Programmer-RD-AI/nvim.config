# nvim.config

My personal Neovim configuration.

## Getting Started

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.
The main configuration is structured within the `lua/` directory:

- `init.lua`: Main entry point, loads other modules.
- `lua/options.lua`: Core Neovim settings.
- `lua/keymaps.lua`: Custom keybindings.
- `lua/plugins.lua`: Plugin specifications for lazy.nvim.
- `lua/colorscheme.lua`: Sets the colorscheme (moonfly).
- `lua/lsp.lua`: Language Server Protocol (LSP) setup using mason.nvim and nvim-lspconfig.

## Custom Keymappings

The leader key is `<Space>`.

### General Mappings (`lua/keymaps.lua`)

- `<leader>w`: Save file
- `<leader>ee`: Toggle file explorer (NvimTree)
- `<leader>ef`: Toggle file explorer on current file (NvimTree)
- `<leader>p` / `<leader>P`: Paste from system clipboard
- `<leader>y` / `<leader>Y`: Copy to system clipboard
- `<leader>lg`: Open LazyGit
- `<leader>/`: Toggle comment (Normal/Visual mode)

### Telescope Mappings (`lua/plugins.lua`)

- `<leader>ff`: Find files
- `<leader>fg`: Live grep
- `<leader>fb`: List open buffers
- `<leader>fh`: Search help tags

### LSP Mappings (`lua/lsp.lua`)

Note: `<Space>` below refers to pressing the Spacebar key.

- `<Space>e`: Show diagnostics on hover
- `[d`: Go to previous diagnostic
- `]d`: Go to next diagnostic
- `<Space>q`: Show all diagnostics in a quickfix list
- `gD`: Go to declaration
- `gd`: Go to definition
- `K`: Show hover information
- `gi`: Go to implementation
- `<C-k>`: Show signature help (while typing or on a function call)
- `<Space>wa`: Add workspace folder
- `<Space>wr`: Remove workspace folder
- `<Space>wl`: List workspace folders
- `<Space>D`: Go to type definition
- `<Space>rn`: Rename symbol
- `<Space>ca`: Show code actions
- `gr`: Find references
- `<Space>f`: Format buffer
