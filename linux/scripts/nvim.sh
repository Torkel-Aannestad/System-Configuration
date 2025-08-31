#!/usr/bin/bash

echo ""
echo "installing neovim"

# install neovim
sudo apt install neovim

# clone nvim config fra seperate repo
git clone https://github.com/Torkel-Aannestad/kickstart.nvim.git "${XDG_CONFIG_HOME}/nvim"

echo "done neovim install"
