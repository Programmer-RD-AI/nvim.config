#!/bin/bash

# ModernVim Installation Script
# This script helps set up the ModernVim Neovim configuration

# ANSI color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}┌───────────────────────────────────┐${NC}"
echo -e "${GREEN}│       ModernVim Installation       │${NC}"
echo -e "${GREEN}└───────────────────────────────────┘${NC}"

# Check if Neovim is installed
if ! command -v nvim &>/dev/null; then
    echo -e "${RED}Neovim is not installed. Please install Neovim version 0.8.0 or higher.${NC}"
    exit 1
fi

# Get Neovim version
nvim_version=$(nvim --version | head -n 1 | cut -d " " -f 2)
echo -e "${YELLOW}Detected Neovim version: ${nvim_version}${NC}"

# Check if Packer is installed
if [ ! -d "${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
    echo -e "${YELLOW}Installing Packer.nvim...${NC}"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
        ${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim
    echo -e "${GREEN}Packer.nvim installed successfully!${NC}"
else
    echo -e "${GREEN}Packer.nvim is already installed.${NC}"
fi

# Back up existing Neovim configuration if it exists
if [ -d "${HOME}/.config/nvim.backup" ]; then
    echo -e "${YELLOW}Removing old backup...${NC}"
    rm -rf "${HOME}/.config/nvim.backup"
fi

if [ -d "${HOME}/.config/nvim" ] && [ "$(pwd)" != "${HOME}/.config/nvim" ]; then
    echo -e "${YELLOW}Backing up existing Neovim configuration...${NC}"
    mv "${HOME}/.config/nvim" "${HOME}/.config/nvim.backup"
    echo -e "${GREEN}Backup created at ${HOME}/.config/nvim.backup${NC}"
fi

# Create config directory if running script from elsewhere
if [ "$(pwd)" != "${HOME}/.config/nvim" ]; then
    echo -e "${YELLOW}Creating Neovim configuration directory...${NC}"
    mkdir -p "${HOME}/.config/nvim"

    echo -e "${YELLOW}Copying configuration files...${NC}"
    cp -R ./* "${HOME}/.config/nvim/"
    echo -e "${GREEN}Configuration files copied successfully!${NC}"
fi

# Install plugins
echo -e "${YELLOW}Installing plugins...${NC}"
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
echo -e "${GREEN}Plugins installed successfully!${NC}"

echo -e "${GREEN}┌───────────────────────────────────┐${NC}"
echo -e "${GREEN}│     Installation completed!        │${NC}"
echo -e "${GREEN}└───────────────────────────────────┘${NC}"
echo -e "${YELLOW}Next steps:${NC}"
echo -e "1. Start Neovim: ${GREEN}nvim${NC}"
echo -e "2. Set up GitHub Copilot: ${GREEN}:Copilot setup${NC}"
echo -e "3. View all available commands by pressing the ${GREEN}Space${NC} key in normal mode"
echo ""
echo -e "${YELLOW}Enjoy your new ModernVim setup!${NC}"
