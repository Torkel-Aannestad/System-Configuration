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

#clone zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "done dev install"
