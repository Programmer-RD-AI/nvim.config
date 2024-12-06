local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
    local buf_set_keymap = vim.api.nvim_buf_set_keymap
    local opts = {
        noremap = true,
        silent = true
    }

    -- Keybindings for LSP features
    buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded"
})

-- Keybinding for hover documentation (press K to show)
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {
    noremap = true,
    silent = true
})

-- Keybinding for showing signature help (press <C-k> to show function signature)
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {
    noremap = true,
    silent = true
})
-- Python LSP (pyright)
lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

-- JavaScript/TypeScript LSP
lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})
-- HTML
lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities
})
-- CSS
lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})
-- C++
lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities
})
-- Java
lspconfig.jdtls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})
-- local lspconfig = require('lspconfig')
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- lspconfig.pyright.setup({
--     capabilities = capabilities
-- })
