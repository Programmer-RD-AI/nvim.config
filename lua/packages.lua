-- Vim package manager setup
vim.cmd [[packadd packer.nvim]]

-- Plugin setup using Packer
local packer = require('packer').startup(function(use)
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- File Explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {'nvim-tree/nvim-web-devicons' -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week
    }

    -- UI Enhancements
    use {
        'nvim-lualine/lualine.nvim', -- Status line
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'github_dark_default' -- Changed to GitHub theme
                }
            }
        end
    }
    use {
        'kyazdani42/nvim-web-devicons', -- File icons
        config = function()
            require('nvim-web-devicons').setup()
        end
    }
    use 'rcarriga/nvim-notify' -- Notification popup UI

    -- Which-key for displaying keybindings
    use {
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup {
                plugins = {
                    spelling = {
                        enabled = true
                    }
                },
                window = {
                    border = "single",
                    padding = {2, 2, 2, 2}
                }
            }
        end
    }

    -- Telescope (File Search)
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-live-grep-args.nvim'}},
        config = function()
            require('telescope').load_extension('live_grep_args')
        end
    }

    -- Telescope extensions
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-telescope/telescope-project.nvim'
    use 'nvim-telescope/telescope-fzf-native.nvim'

    -- Colorschemes
    use 'projekt0n/github-nvim-theme' -- GitHub-like theme

    -- Zen mode for distraction-free coding
    use 'folke/zen-mode.nvim'

    -- Treesitter for Syntax Highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {"lua", "vim", "vimdoc", "python", "javascript", "typescript", "html", "css", "json"},
                highlight = {
                    enable = true
                }
            }
        end
    }

    -- File type specific plugins
    use 'towolf/vim-helm' -- Helm charts (Kubernetes YAML)
    use 'chr4/nginx.vim' -- NGINX config
    use 'ekalinin/Dockerfile.vim' -- Dockerfile syntax
    use 'cespare/vim-toml' -- TOML format
    use 'stephpy/vim-yaml' -- YAML format
    use 'mechatroner/rainbow_csv' -- CSV/TSV format highlighting

    -- Enhanced JSON support with error checking
    use 'elzr/vim-json'

    -- Git Integration
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim' -- Git signs in the gutter

    -- LSP & Autocompletion
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer' -- Buffer completions
    use 'hrsh7th/cmp-path' -- Path completions
    use 'hrsh7th/cmp-cmdline' -- Command line completions
    use 'williamboman/mason.nvim' -- LSP server manager
    use 'williamboman/mason-lspconfig.nvim' -- Mason integration with lspconfig
    use 'neovim/nvim-lspconfig' -- LSP support

    -- Diagnostics and code actions
    use {
        'folke/trouble.nvim', -- Better diagnostic UI
        requires = 'nvim-tree/nvim-web-devicons'
    }

    -- Snippets support
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    -- Python support
    use 'astral-sh/ruff' -- Python linter

    -- Formatting
    use 'jose-elias-alvarez/null-ls.nvim' -- For formatters not available via LSP

    -- GitHub Copilot
    use 'github/copilot.vim'

    -- Integrated Terminal
    use {
        'akinsho/toggleterm.nvim',
        tag = '*'
    }

    -- Comments
    use 'numToStr/Comment.nvim'

    -- Navigation
    use 'ThePrimeagen/harpoon' -- Quick file navigation
    use 'mbbill/undotree' -- Visual undo history
end)

-- Load plugin-specific configurations
require('plugins/cmp')
require('plugins/colors')
require('plugins/fugitive')
require('plugins/telescope')
require('plugins/treesitter')
require('plugins/toggleterm')
require('plugins/Comment')
require('plugins/which-key')
require('plugins/lsp')
require('plugins/mason')
require('plugins/copilot')
require('plugins/harpoon')
require('plugins/undotree')
require('plugins/nvim-tree') -- Add nvim-tree configuration

-- Load optional plugins if they exist
for _, plugin in ipairs({'null-ls', 'gitsigns', 'trouble', 'zen-mode'}) do
    local ok, _ = pcall(require, 'plugins/' .. plugin)
    if not ok then
        -- Plugin config doesn't exist, we'll create it shortly
        -- This prevents errors for new plugins
    end
end

return packer
