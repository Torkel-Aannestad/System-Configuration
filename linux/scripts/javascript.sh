#!/usr/bin/bash

set -e  # exit script if a command fails

echo ""
echo "node"
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
npm config set prefix ~/.local/npm #zshrc should include export PATH="$HOME/.local/npm/bin:$PATH"

echo ""
echo "deno"
curl -fsSL https://deno.land/install.sh | sh

echo ""
echo "bun"
curl -fsSL https://bun.sh/install | bash
