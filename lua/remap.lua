require('globals')
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv'")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dp")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("i", "<C-c>", "<Esc")

vim.keymap.set("n", "Q", "<nop>")
-- fast scrolling
vim.keymap.set('n', 'K', '9j')
vim.keymap.set('n', 'L', '9k')
vim.keymap.set('v', 'K', '9j')
vim.keymap.set('v', 'L', '9k')
-- Mapping U to Redo.
vim.keymap.set('', 'U', '<C-r>')
vim.keymap.set('', '<C-r>', '<NOP>')
-- indent via Tab
vim.keymap.set('n', '<Tab>', '>>_')
vim.keymap.set('n', '<S-Tab>', '<<_')
vim.keymap.set('v', '<Tab>', '>>_')
vim.keymap.set('v', '<S-Tab>', '<<_')
vim.keymap.set('i', '<Tab>', '\t')
vim.keymap.set('i', '<S-Tab>', '\b')
-- window movement
vim.keymap.set('', '<C-w>j', '<C-w>h')
vim.keymap.set('', '<C-w>k', '<C-w>j')
vim.keymap.set('', '<C-w>l', '<C-w>k')
vim.keymap.set('', '<C-w>č', '<C-w>l')
