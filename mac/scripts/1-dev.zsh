#!/bin/zsh

set -e  # exit script if a command fails

brew update

echo ""
echo "starting install..."

brew install git
brew install btop
brew install curl
brew install bat
brew install fd
brew install ripgrep
brew install eza
brew install jq
brew install tldr
brew install wget
brew install lazygit

brew install fzf
$(brew --prefix)/opt/fzf/install --bin #downloads fzf binaries, but does not generate .fzf/zsh

brew install protobuf
protoc --version

echo "done dev install"
