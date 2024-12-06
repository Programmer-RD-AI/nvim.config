# neovim-config

Welcome to my basic Neovim configuration! This is a starting point for a productive development environment with some essential features like autocompletion, LSP (Language Server Protocol), and more. This setup is intentionally kept simple but with room for future expansion as I continue developing it.

## Getting Started

Follow these steps to set up this configuration locally:

### 1. **Install Neovim**

Ensure you have Neovim 0.5 or higher installed. You can find installation instructions on the [official Neovim website](https://neovim.io/).

### 2. **Install [Packer](https://github.com/wbthomason/packer.nvim)**

Packer is the plugin manager used to install and manage Neovim plugins. To install it, run the following command:

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### 3. **Clone This Repository**

Clone this repository to your Neovim configuration folder:

```bash
git clone https://github.com/Programmer-RD-AI/nvim-config ~/.config/nvim
```

### 4. **Install Plugins**

Once the repository is cloned, open Neovim and run the following command to install the plugins:

```bash
:PackerInstall
```

### 5. **Install Language Servers**

To get LSP working, you'll need to install the appropriate language servers. For example, to install `pyright` (Python LSP), use the following command:

```bash
npm install -g pyright
```

### 6. **Start Using Neovim**

After completing the setup, open Neovim:

```bash
nvim
```

---

## Libraries & Packages Used

- **Packer.nvim**: A simple and efficient plugin manager for Neovim.
- **nvim-lspconfig**: Provides default LSP configurations for many languages.
- **nvim-cmp**: Autocompletion plugin to enhance coding efficiency.
- **pyright**: Python Language Server used for autocompletion and linting.

---

## Future Plans

This setup is just the beginning! I’m planning to expand it with the following features in the future:

- **More Language Servers**: I will add support for additional languages like JavaScript, Go, and others.
- **Enhanced UI**: I plan to implement a more customizable user interface with better status lines and theme options.
- **Productivity Tools**: Adding tools like Telescope for searching files, and more advanced features for code navigation and management.
- **Custom Key Mappings**: Fine-tuning the workflow with custom key bindings.

As I grow with Neovim, I plan to improve and add new features, and this repo will continue to evolve into a more powerful setup. Stay tuned for updates! 🚀

---

Feel free to contribute or improve this setup. Your suggestions are always welcome! 😄
