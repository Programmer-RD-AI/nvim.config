-- Key mapping configuration
-- Set leader key to space (defined in globals.lua)
require('globals')

-- File explorer shortcut
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, {
    desc = "Open file explorer"
})

-- Basic editor improvements
vim.keymap.set("n", "<leader>w", ":w<CR>", {
    desc = "Save file"
})
vim.keymap.set("n", "<leader>q", ":q<CR>", {
    desc = "Quit"
})

-- Keep cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", {
    desc = "Scroll down and center"
})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {
    desc = "Scroll up and center"
})

-- Keep cursor centered when searching
vim.keymap.set("n", "n", "nzzzv", {
    desc = "Next search result and center"
})
vim.keymap.set("n", "N", "Nzzzv", {
    desc = "Previous search result and center"
})

-- Better clipboard management
vim.keymap.set("n", "<leader>y", "\"+y", {
    desc = "Yank to system clipboard"
})
vim.keymap.set("v", "<leader>y", "\"+y", {
    desc = "Yank selection to system clipboard"
})

-- Better window navigation - use standard Vim keys
-- <C-w>h, <C-w>j, <C-w>k, <C-w>l for navigation between windows

-- ESC to clear search highlighting
vim.keymap.set("n", "<Esc>", ":noh<CR>", {
    desc = "Clear search highlighting"
})

-- Format code with LSP
vim.keymap.set("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", {
    desc = "Format code"
})

-- Close buffer without closing window
vim.keymap.set("n", "<leader>bd", ":bp<bar>sp<bar>bn<bar>bd<CR>", {
    desc = "Close buffer"
})

-- Easier command access
vim.keymap.set("n", ";", ":", {
    desc = "Enter command mode"
})

-- Quick save and quit
vim.keymap.set("n", "<leader>wq", ":wq<CR>", {
    desc = "Save and quit"
})
