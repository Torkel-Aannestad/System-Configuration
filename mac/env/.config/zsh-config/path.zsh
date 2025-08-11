#!/bin/zsh


addToPathFront "$HOME/.zig"
addToPathFront "$HOME/.deno/bin"
addToPath "$HOME/.cargo/bin"
addToPath "$HOME/.sst/bin"
addToPath "$HOME/.npm-global/bin"

addToPathFront "$HOME/.local/apps      "
addToPathFront "$HOME/.local/scripts"
addToPathFront "$HOME/.local/bin"
addToPathFront "$HOME/.local/n/bin"
addToPathFront "$HOME/.local/npm/bin"
addToPathFront "$HOME/.local/.npm-global/bin"

addToPathFront "$HOME/.local/go/bin"
addToPathFront /usr/local/go/bin

export GOPATH="$HOME/go"
addToPathFront "$GOPATH/bin"
export PNPM_HOME="$HOME/.local/share/pnpm"
addToPath $PNPM_HOME

addToPath "/opt/homebrew/bin"
addToPath "/opt/homebrew/sbin"

addToPath "/opt/homebrew/opt/fzf/bin" #fzf binaries such as auto complete and key bindings
