#!/bin/zsh

set -e  # exit script if a command fails

brew update

echo ""
echo "starting install..."

brew install btop curl bat fd
brew install git ripgrep jq tldr
brew install wget
brew install lazygit

brew install fzf
$(brew --prefix)/opt/fzf/install --bin #downloads fzf binaries, but does not generate .fzf/zsh

brew install protobuf
protoc --version

echo "done dev install"
