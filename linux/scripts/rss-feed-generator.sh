#!/usr/bin/bash

#rss-feed-generator for torkelaannestad.com

set -e 

REPO_URL="https://github.com/Torkel-Aannestad/rss-feed-generator.git"
REPO_DIR="$HOME/personal/rss-feed-generator"

# Clone repo if it doesn't exist
if [ ! -d "$REPO_DIR" ]; then
    git clone "$REPO_URL" "$REPO_DIR"
fi

cd "$REPO_DIR"

# Run make target
make build/app