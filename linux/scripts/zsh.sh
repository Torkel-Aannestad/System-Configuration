#!/usr/bin/bash

sudo apt-get install zsh

sudo chsh -s $(which zsh) #change shell to zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"