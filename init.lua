--[[
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                     
  Modern Neovim Configuration
--]] -- Core Configuration
-- Load essential settings and configurations
require("globals") -- Global variables and options
require("settings") -- Neovim settings and options

-- Plugin Management
require("packages") -- Plugin definitions and setup

-- Keybindings
require("remap") -- Custom key mappings

-- Check health of installation
vim.api.nvim_create_user_command('CheckHealth', 'checkhealth', {})

-- Welcome message 
print("Neovim configuration loaded successfully! 🚀")
