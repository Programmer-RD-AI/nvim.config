-- Configure which-key.nvim to show all available keybindings
local wk = require("which-key")

-- Setup with updated options (addressing deprecation warnings)
wk.setup({
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20 -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>" -- binding to scroll up inside the popup
    },
    -- Replace 'window' with 'win' to fix deprecation warning
    win = {
        border = "rounded", -- none/single/double/shadow
        position = "bottom", -- bottom/top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2}, -- extra window padding [top, right, bottom, left]
        winblend = 0 -- value between 0-100 0 = opaque, 100 = transparent
    },
    layout = {
        height = {
            min = 4,
            max = 25
        }, -- min and max height of the columns
        width = {
            min = 20,
            max = 50
        }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left" -- align columns left/center/right
    },

    -- Adding updated filter option (replacing ignore_missing)
    filter = function(kstr, _)
        return string.match(kstr, "<silent>") == nil and string.match(kstr, "<cmd>") == nil and
                   string.match(kstr, "<Cmd>") == nil and string.match(kstr, "<CR>") == nil and
                   string.match(kstr, "call") == nil and string.match(kstr, "lua") == nil and string.match(kstr, "^:") ==
                   nil and string.match(kstr, "^ ") == nil
    end,

    show_help = true, -- show help message on the command line when the popup is visible
    show_keys = true, -- show the currently pressed key and its label as a message in the command line

    -- Replacing deprecated triggers settings
    triggers = {"<leader>"} -- automatically setup triggers
})

-- New mapping format to fix deprecation warnings
local mappings = { -- File operations mappings
{
    "<leader>ff",
    "<cmd>Telescope find_files<cr>",
    desc = "Find File (Fuzzy Search)"
}, {
    "<leader>fg",
    "<cmd>Telescope live_grep<cr>",
    desc = "Search In Files (Grep)"
}, {
    "<leader>fr",
    "<cmd>Telescope oldfiles<cr>",
    desc = "Open Recent File"
}, {
    "<leader>fn",
    "<cmd>enew<cr>",
    desc = "New File"
}, {
    "<leader>fs",
    "<cmd>w<cr>",
    desc = "Save Current File"
}, {
    "<leader>fa",
    "<cmd>wa<cr>",
    desc = "Save All Files"
}, {
    "<leader>fc",
    "<cmd>Telescope current_buffer_fuzzy_find<cr>",
    desc = "Search In Current File"
}, {
    "<leader>fb",
    "<cmd>Telescope file_browser<cr>",
    desc = "Browse Files"
}, {
    "<leader>fp",
    "<cmd>Telescope projects<cr>",
    desc = "Open Project"
}, {
    "<leader>ft",
    "<cmd>Telescope filetypes<cr>",
    desc = "Change File Type"
}, {
    "<leader>f",
    group = "📁 File Operations"
}, -- Editor operations
{
    "<leader>ee",
    "<cmd>NvimTreeToggle<cr>",
    desc = "File Explorer"
}, {
    "<leader>ef",
    "<cmd>lua vim.lsp.buf.format()<cr>",
    desc = "Format Document"
}, {
    "<leader>es",
    "<cmd>set spell!<cr>",
    desc = "Toggle Spell Check"
}, {
    "<leader>ew",
    "<cmd>set wrap!<cr>",
    desc = "Toggle Word Wrap"
}, {
    "<leader>el",
    "<cmd>set list!<cr>",
    desc = "Toggle Invisible Characters"
}, {
    "<leader>en",
    "<cmd>set number!<cr>",
    desc = "Toggle Line Numbers"
}, {
    "<leader>er",
    "<cmd>set relativenumber!<cr>",
    desc = "Toggle Relative Line Numbers"
}, {
    "<leader>ei",
    "<cmd>set ignorecase!<cr>",
    desc = "Toggle Case Sensitivity"
}, {
    "<leader>eh",
    "<cmd>noh<cr>",
    desc = "Clear Search Highlighting"
}, {
    "<leader>ez",
    "<cmd>ZenMode<cr>",
    desc = "Toggle Zen Mode"
}, {
    "<leader>e",
    group = "✏️ Editor"
}, -- Git operations
{
    "<leader>gs",
    "<cmd>Git<cr>",
    desc = "Git Status"
}, {
    "<leader>gc",
    "<cmd>Git commit<cr>",
    desc = "Git Commit"
}, {
    "<leader>gp",
    "<cmd>Git push<cr>",
    desc = "Git Push"
}, {
    "<leader>gd",
    "<cmd>Git diff<cr>",
    desc = "Git Diff"
}, {
    "<leader>gb",
    "<cmd>Git blame<cr>",
    desc = "Git Blame"
}, {
    "<leader>gl",
    "<cmd>Git log<cr>",
    desc = "Git Log"
}, {
    "<leader>gf",
    "<cmd>Git fetch<cr>",
    desc = "Git Fetch"
}, {
    "<leader>ga",
    "<cmd>Git add .<cr>",
    desc = "Git Add All"
}, {
    "<leader>gr",
    "<cmd>Git reset<cr>",
    desc = "Git Reset"
}, {
    "<leader>gg",
    "<cmd>lua _LAZYGIT_TOGGLE()<cr>",
    desc = "LazyGit (if available)"
}, {
    "<leader>g",
    group = "🌿 Git"
}, -- Terminal operations
{
    "<leader>tt",
    "<cmd>ToggleTerm direction=float<cr>",
    desc = "Toggle Floating Terminal"
}, {
    "<leader>th",
    "<cmd>ToggleTerm direction=horizontal<cr>",
    desc = "Toggle Horizontal Terminal"
}, {
    "<leader>tv",
    "<cmd>ToggleTerm direction=vertical<cr>",
    desc = "Toggle Vertical Terminal"
}, {
    "<leader>tp",
    "<cmd>lua _PYTHON_TOGGLE()<cr>",
    desc = "Toggle Python REPL"
}, {
    "<leader>tn",
    "<cmd>lua _NODE_TOGGLE()<cr>",
    desc = "Toggle Node.js REPL (if available)"
}, {
    "<leader>tb",
    "<cmd>lua _BOTTOM_TOGGLE()<cr>",
    desc = "Toggle Bottom Terminal"
}, {
    "<leader>t",
    group = "🖥️ Terminal"
}, -- LSP operations
{
    "<leader>ld",
    "<cmd>lua vim.lsp.buf.definition()<cr>",
    desc = "Go to Definition"
}, {
    "<leader>lD",
    "<cmd>lua vim.lsp.buf.declaration()<cr>",
    desc = "Go to Declaration"
}, {
    "<leader>lr",
    "<cmd>lua vim.lsp.buf.references()<cr>",
    desc = "Find References"
}, {
    "<leader>li",
    "<cmd>lua vim.lsp.buf.implementation()<cr>",
    desc = "Go to Implementation"
}, {
    "<leader>lt",
    "<cmd>lua vim.lsp.buf.type_definition()<cr>",
    desc = "Go to Type Definition"
}, {
    "<leader>lh",
    "<cmd>lua vim.lsp.buf.hover()<cr>",
    desc = "Hover Documentation"
}, {
    "<leader>ls",
    "<cmd>lua vim.lsp.buf.signature_help()<cr>",
    desc = "Signature Help"
}, {
    "<leader>la",
    "<cmd>lua vim.lsp.buf.code_action()<cr>",
    desc = "Code Action"
}, {
    "<leader>ln",
    "<cmd>lua vim.lsp.buf.rename()<cr>",
    desc = "Rename Symbol"
}, {
    "<leader>lf",
    "<cmd>lua vim.lsp.buf.format()<cr>",
    desc = "Format Code"
}, {
    "<leader>ll",
    "<cmd>lua vim.diagnostic.open_float()<cr>",
    desc = "Line Diagnostics"
}, {
    "<leader>lq",
    "<cmd>lua vim.diagnostic.setloclist()<cr>",
    desc = "Diagnostic List"
}, {
    "<leader>l",
    group = "🔍 Language Server"
}, -- Diagnostics navigation
{
    "<leader>dn",
    "<cmd>lua vim.diagnostic.goto_next()<cr>",
    desc = "Next Diagnostic"
}, {
    "<leader>dp",
    "<cmd>lua vim.diagnostic.goto_prev()<cr>",
    desc = "Previous Diagnostic"
}, {
    "<leader>df",
    "<cmd>lua vim.diagnostic.open_float()<cr>",
    desc = "Show Diagnostic in Float"
}, {
    "<leader>dl",
    "<cmd>lua vim.diagnostic.setloclist()<cr>",
    desc = "List All Diagnostics"
}, {
    "<leader>dq",
    "<cmd>lua vim.diagnostic.setqflist()<cr>",
    desc = "Add Diagnostics to Quickfix"
}, {
    "<leader>d",
    group = "⚠️ Diagnostics"
}, -- File types specific operations
{
    "<leader>md",
    "<cmd>set filetype=dockerfile<cr>",
    desc = "Set as Dockerfile"
}, {
    "<leader>mm",
    "<cmd>set filetype=make<cr>",
    desc = "Set as Makefile"
}, {
    "<leader>mj",
    "<cmd>set filetype=json<cr>",
    desc = "Set as JSON"
}, {
    "<leader>my",
    "<cmd>set filetype=yaml<cr>",
    desc = "Set as YAML"
}, {
    "<leader>mc",
    "<cmd>set filetype=csv<cr>",
    desc = "Set as CSV"
}, {
    "<leader>mh",
    "<cmd>set filetype=html<cr>",
    desc = "Set as HTML"
}, {
    "<leader>mp",
    "<cmd>set filetype=python<cr>",
    desc = "Set as Python"
}, {
    "<leader>ml",
    "<cmd>set filetype=lua<cr>",
    desc = "Set as Lua"
}, {
    "<leader>ms",
    "<cmd>set filetype=sh<cr>",
    desc = "Set as Shell Script"
}, {
    "<leader>m",
    group = "📄 File Types"
}, -- GitHub Copilot
{
    "<leader>cs",
    "<cmd>Copilot status<cr>",
    desc = "Status"
}, {
    "<leader>ce",
    "<cmd>Copilot enable<cr>",
    desc = "Enable"
}, {
    "<leader>cd",
    "<cmd>Copilot disable<cr>",
    desc = "Disable"
}, {
    "<leader>cp",
    "<cmd>Copilot panel<cr>",
    desc = "Open Suggestion Panel"
}, {
    "<leader>ct",
    "<cmd>Copilot setup<cr>",
    desc = "Setup Copilot"
}, {
    "<leader>cr",
    "<cmd>Copilot restart<cr>",
    desc = "Restart Copilot"
}, {
    "<leader>c",
    group = "🤖 Copilot"
}, -- Window management
{
    "<leader>ww",
    "<cmd>w<cr>",
    desc = "Save File"
}, {
    "<leader>wq",
    "<cmd>q<cr>",
    desc = "Quit"
}, {
    "<leader>w=",
    "<cmd>wincmd =<cr>",
    desc = "Equal Width & Height"
}, {
    "<leader>w|",
    "<cmd>vsplit<cr>",
    desc = "Split Vertically"
}, {
    "<leader>w-",
    "<cmd>split<cr>",
    desc = "Split Horizontally"
}, {
    "<leader>wh",
    "<cmd>wincmd h<cr>",
    desc = "Focus Left Window"
}, {
    "<leader>wj",
    "<cmd>wincmd j<cr>",
    desc = "Focus Down Window"
}, {
    "<leader>wk",
    "<cmd>wincmd k<cr>",
    desc = "Focus Up Window"
}, {
    "<leader>wl",
    "<cmd>wincmd l<cr>",
    desc = "Focus Right Window"
}, {
    "<leader>wc",
    "<cmd>wincmd c<cr>",
    desc = "Close Window"
}, {
    "<leader>wo",
    "<cmd>wincmd o<cr>",
    desc = "Close Other Windows"
}, {
    "<leader>w",
    group = "🪟 Window"
}, -- Buffer operations
{
    "<leader>bb",
    "<cmd>Telescope buffers<cr>",
    desc = "List Buffers"
}, {
    "<leader>bn",
    "<cmd>bnext<cr>",
    desc = "Next Buffer"
}, {
    "<leader>bp",
    "<cmd>bprevious<cr>",
    desc = "Previous Buffer"
}, {
    "<leader>bd",
    "<cmd>bp<bar>sp<bar>bn<bar>bd<cr>",
    desc = "Close Buffer (keep window)"
}, {
    "<leader>bf",
    "<cmd>bfirst<cr>",
    desc = "First Buffer"
}, {
    "<leader>bl",
    "<cmd>blast<cr>",
    desc = "Last Buffer"
}, {
    "<leader>bs",
    "<cmd>w<cr>",
    desc = "Save Buffer"
}, {
    "<leader>ba",
    "<cmd>wa<cr>",
    desc = "Save All Buffers"
}, {
    "<leader>b",
    group = "📑 Buffer"
}, -- Search operations
{
    "<leader>sf",
    "<cmd>Telescope find_files<cr>",
    desc = "Find Files"
}, {
    "<leader>sg",
    "<cmd>Telescope live_grep<cr>",
    desc = "Grep in Files"
}, {
    "<leader>sb",
    "<cmd>Telescope buffers<cr>",
    desc = "Search Buffers"
}, {
    "<leader>sh",
    "<cmd>Telescope help_tags<cr>",
    desc = "Search Help"
}, {
    "<leader>sm",
    "<cmd>Telescope man_pages<cr>",
    desc = "Search Man Pages"
}, {
    "<leader>sc",
    "<cmd>Telescope colorscheme<cr>",
    desc = "Colorschemes"
}, {
    "<leader>sk",
    "<cmd>Telescope keymaps<cr>",
    desc = "Search Keymaps"
}, {
    "<leader>ss",
    "<cmd>Telescope lsp_document_symbols<cr>",
    desc = "Document Symbols"
}, {
    "<leader>sw",
    "<cmd>Telescope lsp_workspace_symbols<cr>",
    desc = "Workspace Symbols"
}, {
    "<leader>s",
    group = "🔎 Search"
}, -- Other common operations
{
    "<leader>wq",
    "<cmd>wq<cr>",
    desc = "Save and Quit"
}, {
    "<leader>bd",
    "<cmd>bp<bar>sp<bar>bn<bar>bd<cr>",
    desc = "Close Buffer"
}, {
    "<leader>y",
    "\"+y",
    desc = "Yank to System Clipboard"
}, {
    "<leader>p",
    "\"+p",
    desc = "Paste from System Clipboard"
}, {
    "<leader>u",
    "<cmd>UndotreeToggle<cr>",
    desc = "Toggle Undotree"
}, {
    "<leader>h",
    "<cmd>noh<cr>",
    desc = "Clear Search Highlighting"
}, -- Non-leader key mappings
{
    "<C-\\>",
    "<cmd>ToggleTerm<cr>",
    desc = "Toggle Terminal"
}, {
    "<C-d>",
    "<C-d>zz",
    desc = "Scroll Down and Center"
}, {
    "<C-u>",
    "<C-u>zz",
    desc = "Scroll Up and Center"
}, {
    "n",
    "nzzzv",
    desc = "Next Search Result and Center"
}, {
    "N",
    "Nzzzv",
    desc = "Previous Search Result and Center"
}, {
    ";",
    ":",
    desc = "Enter Command Mode"
}, {
    "<esc>",
    "<cmd>noh<cr>",
    desc = "Clear Search Highlighting"
}, {
    "<F5>",
    "<cmd>lua require'dap'.continue()<CR>",
    desc = "Debug: Continue/Start"
}, {
    "<F9>",
    "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
    desc = "Debug: Toggle Breakpoint"
}, {
    "<F10>",
    "<cmd>lua require'dap'.step_over()<CR>",
    desc = "Debug: Step Over"
}, {
    "<F11>",
    "<cmd>lua require'dap'.step_into()<CR>",
    desc = "Debug: Step Into"
}, {
    "<F12>",
    "<cmd>lua require'dap'.step_out()<CR>",
    desc = "Debug: Step Out"
}}

-- Register all mappings in the new format
wk.register(mappings)

-- Visual mode mappings in the new format
local visual_mappings = {{
    "<leader>y",
    "\"+y",
    desc = "Yank Selection to System Clipboard",
    mode = "v"
}, {
    "<leader>c",
    "<cmd>lua vim.lsp.buf.code_action()<cr>",
    desc = "Code Action on Selection",
    mode = "v"
}, {
    "<leader>f",
    "<cmd>lua vim.lsp.buf.format()<cr>",
    desc = "Format Selected Code",
    mode = "v"
}, {
    "<leader>s",
    "<cmd>sort<cr>",
    desc = "Sort Selection",
    mode = "v"
}, {
    "<leader>//",
    "y/\\V<C-R>=escape(@\", '/')<CR><CR>",
    desc = "Search for Visual Selection",
    mode = "v"
}}

-- Register visual mode mappings
wk.register(visual_mappings)

-- Insert mode mappings in the new format
local insert_mappings = {{
    "<C-Space>",
    "<cmd>lua vim.lsp.buf.signature_help()<cr>",
    desc = "Show Function Signature",
    mode = "i"
}, {
    "<C-n>",
    "<cmd>lua require('cmp').complete()<cr>",
    desc = "Trigger Completion",
    mode = "i"
}}

-- Register insert mode mappings
wk.register(insert_mappings)

-- Terminal mode mappings in the new format
local terminal_mappings = {{
    "<Esc>",
    "<C-\\><C-n>",
    desc = "Exit Terminal Mode",
    mode = "t"
}}

-- Register terminal mode mappings
wk.register(terminal_mappings)

-- Define additional helpful commands for beginners
vim.api.nvim_create_user_command('SaveAll', 'wa', {
    desc = 'Save all changed buffers'
})
vim.api.nvim_create_user_command('Format', 'lua vim.lsp.buf.format()', {
    desc = 'Format current buffer with LSP'
})
vim.api.nvim_create_user_command('Explore', 'Telescope file_browser', {
    desc = 'Open file explorer'
})
vim.api.nvim_create_user_command('Search', 'Telescope live_grep', {
    desc = 'Search in all files'
})
vim.api.nvim_create_user_command('Buffers', 'Telescope buffers', {
    desc = 'List all buffers'
})
