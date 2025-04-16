-- NvimTree Configuration
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    print("nvim-tree not loaded yet. Run :PackerSync and restart Neovim.")
    return
end

-- Disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Setup nvim-tree
nvim_tree.setup({
    sort_by = "case_sensitive",
    view = {
        width = 30
    },
    renderer = {
        group_empty = true,
        icons = {
            show = {
                git = true,
                file = true,
                folder = true,
                folder_arrow = true
            }
        }
    },
    filters = {
        dotfiles = false
    },
    git = {
        enable = true,
        ignore = false
    },
    actions = {
        open_file = {
            quit_on_open = false,
            window_picker = {
                enable = true
            }
        }
    },
    on_attach = function(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
            return {
                desc = 'nvim-tree: ' .. desc,
                buffer = bufnr,
                noremap = true,
                silent = true,
                nowait = true
            }
        end

        -- Apply default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- Add custom mappings
        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    end
})

-- Define keymaps to toggle tree view
vim.keymap.set('n', '<leader>e', function()
    require('nvim-tree.api').tree.toggle()
end, {
    desc = "Toggle NvimTree"
})
vim.keymap.set('n', '<leader>ee', function()
    require('nvim-tree.api').tree.toggle()
end, {
    desc = "Toggle NvimTree"
})
