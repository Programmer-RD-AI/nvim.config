vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {
    desc = 'Save'
})

vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", {
    desc = "Toggle file explorer"
})

vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", {
    desc = "Toggle file explorer on current file"
})

vim.keymap.set({'n', 'v'}, '<leader>p', '"*p', {
    desc = 'Paste from system clipboard'
})
vim.keymap.set({'n', 'v'}, '<leader>P', '"+p', {
    desc = 'Paste from system clipboard (alternative)'
})
vim.keymap.set({'n', 'v'}, '<leader>y', '"*y', {
    desc = 'Copy to system clipboard'
})
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+y', {
    desc = 'Copy to system clipboard (alternative)'
})

vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', {
    desc = 'Open LazyGit'
})
