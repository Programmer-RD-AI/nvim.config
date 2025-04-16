-- Global Variables and Settings
-- Set leader key to space for easily accessible keybindings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable mouse support in all modes
vim.g.mouse = "a"

-- Netrw (built-in file explorer) settings
vim.g.netrw_banner = 0 -- Hide banner
vim.g.netrw_browse_split = 0 -- Open files in the same window
vim.g.netrw_winsize = 25 -- Set explorer width to 25%
vim.g.netrw_liststyle = 3 -- Tree view

-- Disable some unused built-in plugins for better startup time
local disabled_built_ins = {"netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers", "gzip", "zip", "zipPlugin",
                            "tar", "tarPlugin", "getscript", "getscriptPlugin", "vimball", "vimballPlugin",
                            "2html_plugin", "logipat", "rrhelper", "spellfile_plugin"}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- Global behavior adjustments
vim.opt.shortmess:append("c") -- Don't show completion messages
vim.g.completeopt = "menu,menuone,noselect"
