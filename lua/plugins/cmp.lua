-- Completion configuration
local cmp = require('cmp')
local luasnip = require('luasnip')

-- Load VSCode-style snippets from friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
            select = true
        }), -- Accept currently selected item

        -- Tab and S-Tab to navigate through completion suggestions
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'})
    }),
    sources = cmp.config.sources({{
        name = 'nvim_lsp'
    }, -- LSP completion source
    {
        name = 'luasnip'
    }, -- Snippets source
    {
        name = 'buffer'
    }, -- Text within current buffer
    {
        name = 'path'
    } -- File system paths
    }),
    formatting = {
        format = function(entry, vim_item)
            -- Source-specific customizations
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]"
            })[entry.source.name]
            return vim_item
        end
    },
    -- Sort completions by their score
    sorting = {
        comparators = {cmp.config.compare.offset, cmp.config.compare.exact, cmp.config.compare.score,
                       cmp.config.compare.recently_used, cmp.config.compare.kind, cmp.config.compare.sort_text,
                       cmp.config.compare.length, cmp.config.compare.order}
    }
})

-- Enable completion in command line mode
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{
        name = 'path'
    }, {
        name = 'cmdline'
    }})
})

-- Enable completion in search mode
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{
        name = 'buffer'
    }}
})
