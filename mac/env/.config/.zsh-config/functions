#!/bin/zsh

cheat() {
  curl https://cheat.sh/"$1"
}

addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

#Change Directory
fd() {
  DIR=$(find . -type d -prune | fzf) && cd "$DIR"
}
#find project
fp() {
    DIR=$(find ~/projects ~/projects/test-projects ~/projects/frontend-masters -type d -prune | fzf) && cd "$DIR"
}
