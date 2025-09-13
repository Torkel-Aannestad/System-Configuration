#!/bin/zsh

set -e  # exit script if a command fails

brew update

echo ""
echo "starting install..."

brew install lazygit
brew install zsh-autosuggestions

brew install fzf
$(brew --prefix)/opt/fzf/install --bin #downloads fzf binaries, but does not generate .fzf/zsh

brew install protobuf
protoc --version

echo "done dev install"
