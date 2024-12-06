local cmp = require 'cmp'

cmp.setup({
    sources = {{
        name = 'nvim_lsp'
    }, {
        name = 'buffer'
    }},
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({
            select = true
        })
    }
    -- window.documentation = {
    --     border = "rounded" -- Add rounded borders to documentation popups
    -- }
})
