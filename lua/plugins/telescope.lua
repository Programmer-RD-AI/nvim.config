-- Telescope configuration
local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = {"smart"},
        file_ignore_patterns = {".git/", "node_modules/", "__pycache__/", "%.pyc", "%.pyo", "%.o", "%.a", "%.so",
                                "%.obj"},
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-c>"] = actions.close,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-/>"] = actions.which_key, -- keys from pressing <C-/>
                ["<C-_>"] = actions.which_key -- keys from pressing <C-_>
            },
            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down
            }
        },
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8
            },
            vertical = {
                mirror = false
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120
        },
        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"}
    },
    pickers = {
        find_files = {
            theme = "dropdown",
            previewer = false,
            find_command = {"fd", "--type", "f", "--strip-cwd-prefix"}
        },
        live_grep = {
            theme = "ivy"
        },
        buffers = {
            theme = "dropdown",
            previewer = false
        }
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    ["<C-w>"] = function()
                        vim.cmd('normal vbd')
                    end
                },
                ["n"] = {
                    -- your custom normal mode mappings
                    ["N"] = require("telescope").extensions.file_browser.actions.create,
                    ["h"] = require("telescope").extensions.file_browser.actions.goto_parent_dir,
                    ["/"] = function()
                        vim.cmd('startinsert')
                    end
                }
            }
        },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        },
        project = {
            -- Configuration options for project extension
        }
    }
}

-- Load extensions
telescope.load_extension('live_grep_args')

-- Try to load optional extensions if available
local function load_telescope_extension(extension_name)
    pcall(function()
        telescope.load_extension(extension_name)
    end)
end

load_telescope_extension('file_browser')
load_telescope_extension('fzf')
load_telescope_extension('project')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({
        search = vim.fn.input("Grep > ")
    })
end)
vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<CR>', {
    noremap = true
})
