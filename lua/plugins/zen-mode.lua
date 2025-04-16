-- Zen Mode configuration for distraction-free coding
require('zen-mode').setup {
    window = {
        backdrop = 0.95, -- shade the backdrop of the Zen window
        width = 0.85, -- width of the Zen window
        height = 0.95, -- height of the Zen window
        options = {
            signcolumn = "no", -- disable signcolumn
            number = false, -- disable number column
            relativenumber = false, -- disable relative numbers
            cursorline = false, -- disable cursorline
            cursorcolumn = false, -- disable cursor column
            foldcolumn = "0", -- disable fold column
            list = false -- disable whitespace characters
        }
    },
    plugins = {
        -- disable various plugins
        options = {
            enabled = true,
            ruler = false, -- disables the ruler text in the cmd line area
            showcmd = false -- disables the command in the last line of the screen
        },
        twilight = {
            enabled = false
        }, -- enable to start Twilight when zen mode opens
        gitsigns = {
            enabled = false
        }, -- disables git signs
        tmux = {
            enabled = false
        } -- disables the tmux statusline
    },
    -- callback where you can add custom code when the Zen window opens
    on_open = function(_)
        vim.cmd('echo "Zen Mode enabled"')
    end,
    -- callback where you can add custom code when the Zen window closes
    on_close = function()
        vim.cmd('echo "Zen Mode disabled"')
    end
}

-- Add keymapping for Zen Mode
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", {
    silent = true,
    noremap = true
})
