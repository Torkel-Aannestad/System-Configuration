#!/bin/zsh

set -e  # exit script if a command fails

brew install node@lts
npm config set prefix ~/.local/npm #zshrc should include export PATH="$HOME/.local/npm/bin:$PATH"

brew install deno
curl -fsSL https://bun.sh/install | bash
