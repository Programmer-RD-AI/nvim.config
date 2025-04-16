# ModernVim

![Neovim Logo](https://neovim.io/logos/neovim-mark-flat.png)

A modern, feature-rich Neovim configuration with a focus on simplicity and productivity. This setup includes GitHub Copilot integration, extensive language support, powerful code completion, and a clean, visually appealing interface.

## Features

- **GitHub Copilot Integration**: AI-powered code suggestions
- **Which-key**: Visual display of all available keybindings with detailed descriptions
- **Modern UI**: GitHub-inspired theme with sleek aesthetics
- **Integrated Terminal**: With dedicated Python REPL and multi-pane support
- **Advanced LSP Support**: Intelligent code completion and diagnostics
- **Multi-Language Support**: First-class support for Python, JavaScript, TypeScript, HTML, CSS, JSON, YAML, Dockerfile, Makefile, and CSV
- **Enhanced Git Integration**: Git signs, blame, and seamless workflow integration
- **Telescope with Extensions**: Powerful fuzzy finding for files, code, and more
- **Distraction-Free Coding**: Zen mode for focused work
- **Beginner-Friendly**: Extensive documentation and intuitive menus

## Installation

### Prerequisites

- Neovim 0.8.0 or higher
- Git
- Node.js and npm (for GitHub Copilot and language servers)
- A terminal with good font support (recommended: a Nerd Font)
- ripgrep (for Telescope live grep functionality)

### Quick Setup

1. **Install Neovim (0.8.0+)**

   Follow the instructions on the [official Neovim website](https://neovim.io/).

2. **Install Packer.nvim (Plugin Manager)**

   ```bash
   git clone --depth 1 https://github.com/wbthomason/packer.nvim \
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```

3. **Clone This Configuration**

   ```bash
   git clone https://github.com/yourusername/ModernVim ~/.config/nvim
   ```

4. **Install Plugins**

   Open Neovim and run:

   ```
   :PackerSync
   ```

5. **Set Up GitHub Copilot**

   After installing plugins, run:

   ```
   :Copilot setup
   ```

   Follow the authentication process to link your GitHub account.

6. **Install Language Servers (Optional)**

   The configuration will automatically install language servers through Mason, but you can also manually install them:

   ```bash
   # For Python
   npm install -g pyright

   # For JavaScript/TypeScript
   npm install -g typescript-language-server typescript

   # For JSON
   npm install -g vscode-langservers-extracted

   # For YAML
   npm install -g yaml-language-server

   # For Dockerfile
   npm install -g dockerfile-language-server-nodejs
   ```

## Usage Guide

### Key Bindings

ModernVim uses a carefully selected set of keybindings to enhance your productivity. The Space key (leader) activates the which-key interface, showing you all available commands with descriptions.

#### File Operations

| Keybinding  | Mode   | Description                    |
| ----------- | ------ | ------------------------------ |
| `<Space>ff` | Normal | Find files (fuzzy search)      |
| `<Space>fg` | Normal | Search in files (live grep)    |
| `<Space>fr` | Normal | Open recent files              |
| `<Space>fb` | Normal | Browse files with file browser |
| `<Space>fs` | Normal | Save current file              |
| `<Space>fa` | Normal | Save all files                 |
| `<Space>fn` | Normal | Create new file                |
| `<Space>fc` | Normal | Search in current file         |
| `<Space>ft` | Normal | Change file type               |

#### Editor Operations

| Keybinding  | Mode   | Description                  |
| ----------- | ------ | ---------------------------- |
| `<Space>ee` | Normal | Open file explorer           |
| `<Space>ef` | Normal | Format document              |
| `<Space>es` | Normal | Toggle spell check           |
| `<Space>ew` | Normal | Toggle word wrap             |
| `<Space>el` | Normal | Toggle invisible characters  |
| `<Space>en` | Normal | Toggle line numbers          |
| `<Space>er` | Normal | Toggle relative line numbers |
| `<Space>ei` | Normal | Toggle case sensitivity      |
| `<Space>eh` | Normal | Clear search highlighting    |
| `<Space>ez` | Normal | Toggle Zen mode              |

#### Code Navigation & LSP

| Keybinding  | Mode   | Description               |
| ----------- | ------ | ------------------------- |
| `<Space>ld` | Normal | Go to definition          |
| `<Space>lD` | Normal | Go to declaration         |
| `<Space>lr` | Normal | Find references           |
| `<Space>li` | Normal | Go to implementation      |
| `<Space>lt` | Normal | Go to type definition     |
| `<Space>lh` | Normal | Hover documentation       |
| `<Space>ls` | Normal | Signature help            |
| `<Space>la` | Normal | Code actions              |
| `<Space>ln` | Normal | Rename symbol             |
| `<Space>lf` | Normal | Format code               |
| `<Space>ll` | Normal | Line diagnostics          |
| `<Space>lq` | Normal | Diagnostic list           |
| `[d`        | Normal | Go to previous diagnostic |
| `]d`        | Normal | Go to next diagnostic     |
| `gd`        | Normal | Go to definition          |
| `K`         | Normal | Show hover documentation  |

#### Diagnostics

| Keybinding  | Mode   | Description                     |
| ----------- | ------ | ------------------------------- |
| `<Space>dn` | Normal | Next diagnostic                 |
| `<Space>dp` | Normal | Previous diagnostic             |
| `<Space>df` | Normal | Show diagnostic in float        |
| `<Space>dl` | Normal | List all diagnostics            |
| `<Space>xx` | Normal | Toggle Trouble (diagnostics UI) |
| `<Space>xw` | Normal | Workspace diagnostics           |
| `<Space>xd` | Normal | Document diagnostics            |
| `<Space>xl` | Normal | Location list                   |
| `<Space>xq` | Normal | Quickfix list                   |

#### File Types Support

| Keybinding  | Mode   | Description         |
| ----------- | ------ | ------------------- |
| `<Space>md` | Normal | Set as Dockerfile   |
| `<Space>mm` | Normal | Set as Makefile     |
| `<Space>mj` | Normal | Set as JSON         |
| `<Space>my` | Normal | Set as YAML         |
| `<Space>mc` | Normal | Set as CSV          |
| `<Space>mh` | Normal | Set as HTML         |
| `<Space>mp` | Normal | Set as Python       |
| `<Space>ml` | Normal | Set as Lua          |
| `<Space>ms` | Normal | Set as Shell Script |

#### Terminal

| Keybinding  | Mode     | Description                |
| ----------- | -------- | -------------------------- |
| `<C-\>`     | Any      | Toggle floating terminal   |
| `<Space>tt` | Normal   | Toggle floating terminal   |
| `<Space>th` | Normal   | Toggle horizontal terminal |
| `<Space>tv` | Normal   | Toggle vertical terminal   |
| `<Space>tp` | Normal   | Toggle Python REPL         |
| `<Space>tn` | Normal   | Toggle Node.js REPL        |
| `<Space>tb` | Normal   | Toggle bottom terminal     |
| `<Esc>`     | Terminal | Exit terminal mode         |

#### GitHub Copilot

| Keybinding  | Mode   | Description                 |
| ----------- | ------ | --------------------------- |
| `<C-y>`     | Insert | Accept Copilot suggestion   |
| `<M-]>`     | Insert | Next Copilot suggestion     |
| `<M-[>`     | Insert | Previous Copilot suggestion |
| `<M-x>`     | Insert | Dismiss Copilot suggestion  |
| `<M-CR>`    | Insert | Request Copilot suggestion  |
| `<Space>cs` | Normal | Copilot status              |
| `<Space>ce` | Normal | Enable Copilot              |
| `<Space>cd` | Normal | Disable Copilot             |
| `<Space>cp` | Normal | Open suggestion panel       |
| `<Space>ct` | Normal | Setup Copilot               |
| `<Space>cr` | Normal | Restart Copilot             |

#### Git Integration

| Keybinding   | Mode   | Description               |
| ------------ | ------ | ------------------------- |
| `<Space>gs`  | Normal | Git status                |
| `<Space>gc`  | Normal | Git commit                |
| `<Space>gp`  | Normal | Git push                  |
| `<Space>gd`  | Normal | Git diff                  |
| `<Space>gb`  | Normal | Git blame                 |
| `<Space>gl`  | Normal | Git log                   |
| `<Space>gf`  | Normal | Git fetch                 |
| `<Space>ga`  | Normal | Git add all               |
| `<Space>gr`  | Normal | Git reset                 |
| `<Space>gh`  | Normal | Preview git hunk          |
| `<Space>gD`  | Normal | Diff this                 |
| `<Space>gtb` | Normal | Toggle current line blame |
| `<Space>gtd` | Normal | Toggle deleted            |
| `]c`         | Normal | Next git hunk             |
| `[c`         | Normal | Previous git hunk         |

#### Window Management

| Keybinding        | Mode   | Description                           |
| ----------------- | ------ | ------------------------------------- |
| `<Space>ww`       | Normal | Save file                             |
| `<Space>wq`       | Normal | Quit                                  |
| `<Space>w=`       | Normal | Equal width & height                  |
| `<Space>w\|`      | Normal | Split vertically                      |
| `<Space>w-`       | Normal | Split horizontally                    |
| `<Space>wh/j/k/l` | Normal | Focus left/down/up/right window       |
| `<Space>wc`       | Normal | Close window                          |
| `<Space>wo`       | Normal | Close other windows                   |
| `<C-w>s`          | Normal | Split window horizontally             |
| `<C-w>v`          | Normal | Split window vertically               |
| `<C-w>c`          | Normal | Close window                          |
| `<C-w>o`          | Normal | Close all other windows               |
| `<C-w>h/j/k/l`    | Normal | Navigate to window left/down/up/right |
| `<C-w>H/J/K/L`    | Normal | Move window left/down/up/right        |
| `<C-w>=`          | Normal | Make all windows equal size           |

#### Buffer Operations

| Keybinding  | Mode   | Description                |
| ----------- | ------ | -------------------------- |
| `<Space>bb` | Normal | List buffers               |
| `<Space>bn` | Normal | Next buffer                |
| `<Space>bp` | Normal | Previous buffer            |
| `<Space>bd` | Normal | Close buffer (keep window) |
| `<Space>bf` | Normal | First buffer               |
| `<Space>bl` | Normal | Last buffer                |
| `<Space>bs` | Normal | Save buffer                |
| `<Space>ba` | Normal | Save all buffers           |

#### Search Operations

| Keybinding  | Mode   | Description       |
| ----------- | ------ | ----------------- |
| `<Space>sf` | Normal | Find files        |
| `<Space>sg` | Normal | Grep in files     |
| `<Space>sb` | Normal | Search buffers    |
| `<Space>sh` | Normal | Search help       |
| `<Space>sm` | Normal | Search man pages  |
| `<Space>sc` | Normal | Colorschemes      |
| `<Space>sk` | Normal | Search keymaps    |
| `<Space>ss` | Normal | Document symbols  |
| `<Space>sw` | Normal | Workspace symbols |
| `<C-p>`     | Normal | Find Git files    |

#### Clipboard & Text Manipulation

| Keybinding  | Mode   | Description                        |
| ----------- | ------ | ---------------------------------- |
| `<Space>y`  | Normal | Yank to system clipboard           |
| `<Space>y`  | Visual | Yank selection to system clipboard |
| `<Space>p`  | Normal | Paste from system clipboard        |
| `gcc`       | Normal | Comment/uncomment current line     |
| `gc`        | Visual | Comment/uncomment selected lines   |
| `<Space>f`  | Visual | Format selected code               |
| `<Space>s`  | Visual | Sort selection                     |
| `<Space>//` | Visual | Search for visual selection        |

#### Completion & Snippets

| Keybinding    | Mode   | Description                            |
| ------------- | ------ | -------------------------------------- |
| `<Tab>`       | Insert | Next completion item or expand snippet |
| `<S-Tab>`     | Insert | Previous completion item               |
| `<C-Space>`   | Insert | Trigger completion                     |
| `<C-e>`       | Insert | Close completion menu                  |
| `<CR>`        | Insert | Confirm selection                      |
| `<C-b>/<C-f>` | Insert | Scroll documentation up/down           |
| `<C-n>`       | Insert | Trigger completion                     |

#### Miscellaneous

| Keybinding | Mode   | Description               |
| ---------- | ------ | ------------------------- |
| `<Space>`  | Normal | Show which-key menu       |
| `<Space>u` | Normal | Toggle Undotree           |
| `<Space>z` | Normal | Toggle Zen mode           |
| `<Esc>`    | Normal | Clear search highlighting |
| `<F5>`     | Normal | Debug: Continue/Start     |
| `<F9>`     | Normal | Debug: Toggle Breakpoint  |
| `<F10>`    | Normal | Debug: Step Over          |
| `<F11>`    | Normal | Debug: Step Into          |
| `<F12>`    | Normal | Debug: Step Out           |

### New User Commands

| Command    | Description                    |
| ---------- | ------------------------------ |
| `:SaveAll` | Save all changed buffers       |
| `:Format`  | Format current buffer with LSP |
| `:Explore` | Open file explorer             |
| `:Search`  | Search in all files            |
| `:Buffers` | List all buffers               |

### File Type Support

ModernVim now provides enhanced support for:

- **Dockerfile**: Syntax highlighting, linting, and auto-completion
- **Makefile**: Proper indentation and syntax highlighting
- **JSON**: Schema validation, formatting, and error checking
- **YAML**: Schema validation for Kubernetes, Docker Compose, and more
- **CSV**: Rainbow highlighting for better column visibility
- **TOML**: Configuration file support
- **Helm Charts**: Kubernetes YAML templating
- **NGINX configs**: Syntax highlighting and indentation

### Tips for Efficient Usage

1. **Use Which-Key as a Reference**: Press `<Space>` and wait for a moment to see all available commands with detailed descriptions.

2. **Master Telescope**: The Telescope fuzzy finder (`<Space>ff`, `<Space>fg`) is one of the most powerful tools for navigating your codebase. Try the file browser with `<Space>fb`.

3. **Learn LSP Navigation**: Use the Language Server Protocol for intelligent code navigation with `<Space>ld` (go to definition) and `<Space>lr` (find references).

4. **Terminal Integration**: Access multiple terminal instances using `<Space>tt` (floating), `<Space>th` (horizontal), or `<Space>tv` (vertical).

5. **Git Integration**: View file changes in the gutter with GitSigns and manage your Git workflow with `<Space>g` prefix commands.

6. **Zen Mode**: Enter distraction-free coding with `<Space>z` to focus on your current task.

7. **Diagnostics Navigation**: Use Trouble for better diagnostics visualization with `<Space>xx`.

8. **Custom File Type Settings**: Quickly set a file's type with `<Space>m` prefix commands.

9. **Window Management**: Efficiently manage your workspace with dedicated window commands via `<Space>w`.

10. **Advanced Search Operations**: Perform powerful searches using the `<Space>s` prefix.

## Customization

This configuration is designed to be extended. Here's how to customize it:

- **Add New Plugins**: Edit `lua/packages.lua`
- **Change Keybindings**: Edit `lua/remap.lua` or more specifically `lua/plugins/which-key.lua`
- **Modify Settings**: Edit `lua/settings.lua`
- **Configure LSP**: Edit `lua/plugins/lsp.lua` to add language servers
- **Add Treesitter Languages**: Edit `lua/plugins/treesitter.lua`

## Project Structure

```
init.lua               # Main entry point
lua/
  ├── globals.lua      # Global variables and options
  ├── packages.lua     # Plugin definitions
  ├── remap.lua        # Core key mappings
  ├── settings.lua     # Neovim settings
  └── plugins/         # Plugin-specific configurations
      ├── cmp.lua      # Completion
      ├── copilot.lua  # GitHub Copilot
      ├── lsp.lua      # Language Server Protocol
      ├── treesitter.lua # Syntax highlighting
      ├── which-key.lua  # Keybinding management
      ├── telescope.lua  # Fuzzy finder
      ├── trouble.lua  # Diagnostics UI
      ├── gitsigns.lua # Git integration
      ├── zen-mode.lua # Distraction-free coding
      └── ...         # Other plugin configs
```

## Acknowledgments

This configuration builds upon the amazing work of the Neovim community and the following projects:

- [Neovim](https://neovim.io/)
- [GitHub Copilot](https://github.com/github/copilot.vim)
- [Which-Key](https://github.com/folke/which-key.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Trouble](https://github.com/folke/trouble.nvim)
- [GitSigns](https://github.com/lewis6991/gitsigns.nvim)
- [Zen Mode](https://github.com/folke/zen-mode.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## License

MIT
