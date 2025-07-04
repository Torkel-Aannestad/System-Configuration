#!/usr/bin/bash

set -e  # exit script if a command fails

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
npm config set prefix ~/.local/npm #zshrc should include export PATH="$HOME/.local/npm/bin:$PATH"

curl -fsSL https://deno.land/install.sh | sh
curl -fsSL https://bun.sh/install | bash
