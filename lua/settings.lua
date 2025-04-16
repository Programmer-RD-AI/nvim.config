-- Basic settings for a clean, user-friendly Neovim experience
vim.opt.guicursor = ""
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers for easier navigation

-- Indentation
vim.opt.tabstop = 2 -- Number of spaces a tab counts for
vim.opt.softtabstop = 2 -- Number of spaces a tab counts for when editing
vim.opt.shiftwidth = 2 -- Number of spaces for each step of autoindent
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Smart autoindenting when starting a new line

-- Search
vim.opt.hlsearch = false -- Don't highlight all search matches
vim.opt.incsearch = true -- Show matches as you type
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override ignorecase if search has uppercase

-- Files
vim.opt.swapfile = false -- Don't create swap files
vim.opt.backup = false -- Don't create backup files
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true -- Persistent undo history

-- UI improvements
vim.opt.termguicolors = true -- True color support
vim.opt.scrolloff = 8 -- Minimum number of screen lines above and below the cursor
vim.opt.signcolumn = "yes" -- Always show the sign column
vim.opt.colorcolumn = "80" -- Highlight column 80
vim.opt.cursorline = true -- Highlight the current line

-- Performance
vim.opt.updatetime = 50 -- Faster update time

-- Splitting behavior
vim.opt.splitright = true -- Vertical splits open to the right
vim.opt.splitbelow = true -- Horizontal splits open below

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
