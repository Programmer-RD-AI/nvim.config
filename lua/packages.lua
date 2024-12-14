-- Vim package manager setup
vim.cmd [[packadd packer.nvim]]

-- Plugin setup using Packer
local packer = require('packer').startup(function(use)
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- UI Enhancements
    use {
        'nvim-lualine/lualine.nvim', -- Status line
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'gruvbox'
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
    use('ThePrimeagen/harpoon') -- Quick file navigation
    use 'rcarriga/nvim-notify' -- Notification popup UI

    -- Telescope (File Search)
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-live-grep-args.nvim'}},
        config = function()
            require('telescope').load_extension('live_grep_args')
        end
    }

    -- Colorschemes
    use 'drewtempelmeyer/palenight.vim'

    -- Treesitter for Syntax Highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = "all",
                highlight = {
                    enable = true
                }
            }
        end
    }
    use 'nvim-treesitter/playground'

    -- Git Integration
    use 'tpope/vim-fugitive'

    -- LSP & Autocompletion
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer' -- Buffer completions
    use 'hrsh7th/cmp-path' -- Path completions
    use 'hrsh7th/cmp-cmdline' -- Command line completions
    use 'williamboman/mason.nvim' -- LSP server manager
    use 'williamboman/mason-lspconfig.nvim' -- Mason integration with lspconfig
    use 'neovim/nvim-lspconfig' -- LSP support
    -- use('jose-elias-alvarez/null-ls.nvim')
    -- use('MunifTanjim/prettier.nvim')
    use "astral-sh/ruff"

		-- Debugging
    use {
        'mfussenegger/nvim-dap', -- Debug Adapter Protocol
        'mfussenegger/nvim-dap-python', -- Python debugging
        config = function()
            require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
        end
    }

    -- Markdown Support
    use 'godlygeek/tabular'
    use 'preservim/vim-markdown'
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = {"markdown"}
        end
    }

    -- LaTeX Support
    use 'lervag/vimtex'

    -- Smooth Scrolling
   use "karb94/neoscroll.nvim"

   -- Comments
   use 'numToStr/Comment.nvim'
end)

-- Load plugin-specific configurations
require('plugins/cmp')
require('plugins/colors')
require('plugins/fugitive')
require('plugins/harpoon')
require('plugins/lsp')
require('plugins/mason')
require('plugins/telescope')
require('plugins/treesitter')
require('plugins/undotree')
require('plugins/neoscroll')
require('plugins/Comment')
-- require('plugins/null-ls')
-- require('plugins/prettier')
require("plugins/ruff")

return packer
