-- Terminal configuration
require("toggleterm").setup({
    -- size can be a number or function which is passed the current terminal
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<c-\>]], -- Use <C-\> to toggle terminal
    hide_numbers = true, -- Hide the number column
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2, -- The degree by which to darken terminal color (0 - 1)
    start_in_insert = true,
    insert_mappings = true, -- Match terminal mode for key mappings
    persist_size = true,
    direction = "float", -- Default direction
    close_on_exit = true, -- Close the terminal window when process exits
    shell = vim.o.shell, -- Use default shell
    -- Float configuration
    float_opts = {
        border = "curved", -- single, double, shadow, curved
        winblend = 0, -- Window transparency (0-100)
        highlights = {
            border = "Normal",
            background = "Normal"
        }
    }
})

-- Python-specific terminal
local Terminal = require('toggleterm.terminal').Terminal

-- Create a Python REPL terminal
local python = Terminal:new({
    cmd = "python3",
    direction = "float",
    float_opts = {
        border = "curved"
    },
    -- Function to run before showing the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-t>", "<cmd>close<CR>", {
            noremap = true,
            silent = true
        })
    end
})

-- Function to toggle Python REPL
function _PYTHON_TOGGLE()
    python:toggle()
end

-- Bind Python REPL to a key
vim.api.nvim_set_keymap("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", {
    noremap = true,
    silent = true
})
