-- GitHub Copilot configuration
vim.g.copilot_no_tab_map = true -- Don't use Tab for completions to avoid conflicts
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

-- Accept suggestions with <C-y> (same as native completion)
vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("<CR>")', {
    expr = true,
    silent = true
})

-- Cycle through suggestions
vim.api.nvim_set_keymap("i", "<M-]>", "<Plug>(copilot-next)", {
    silent = true
})
vim.api.nvim_set_keymap("i", "<M-[>", "<Plug>(copilot-previous)", {
    silent = true
})

-- Dismiss the current suggestion
vim.api.nvim_set_keymap("i", "<M-x>", "<Plug>(copilot-dismiss)", {
    silent = true
})

-- Request a suggestion manually
vim.api.nvim_set_keymap("i", "<M-CR>", "<Plug>(copilot-suggest)", {
    silent = true
})
