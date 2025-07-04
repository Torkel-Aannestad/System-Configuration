#!/usr/bin/bash

addToPathFront $HOME/.zig
addToPathFront $HOME/.deno/bin
addToPath $HOME/.cargo/bin
addToPath $HOME/.sst/bin
addToPath $HOME/.npm-global/bin

addToPathFront $HOME/.local/apps      
addToPathFront $HOME/.local/scripts
addToPathFront $HOME/.local/bin
addToPathFront $HOME/.local/n/bin
addToPathFront $HOME/.local/npm/bin
addToPathFront $HOME/.local/.npm-global/bin

addToPathFront $HOME/.local/go/bin
addToPathFront /usr/local/go/bin
addToPathFront /usr/lib/mime/packages/

export GOPATH=$HOME/go
addToPathFront $GOPATH/bin
export PNPM_HOME="$HOME/.local/share/pnpm"
addToPath $PNPM_HOME

# addToPathFront $HOME/.yarn/bin

# bun completions
[ -s "/home/torkel/.oh-my-zsh/completions/_bun" ] && source "/home/torkel/.oh-my-zsh/completions/_bun"
addToPath "$HOME/.bun/bin"