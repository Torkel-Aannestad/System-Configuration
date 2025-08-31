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

#Navigate Directory
nd() {
  DIR=$(fd . --type d --hidden --exclude .git --exclude node_modules 2>/dev/null | fzf) && cd "$DIR"
}

#navigate projects
np() {
    DIR=$(fd . ~/projects \
    ~/projects/test \
    ~/projects/coop \
    ~/projects/personal \
    ~/projects/personal/bootdev \
    ~/projects/personal/frontend-masters \
    --hidden --type d --exclude .git --exclude node_modules --max-depth 1 2>/dev/null | fzf) && cd "$DIR"
}

#ls function with option to pass additional arguments
unalias ls 2>/dev/null #unalias ls and send errors to dev/null if ls does not have an alias
ls() {
    eza --all --icons=auto --git-ignore --long --no-filesize --no-user --no-time "$@"
}

#ls with three view
lst(){
    ls --tree --level=3 "$@"
}

#open system-configuration in zed
editconfig(){
    zed $HOME/projects/system-configuration/mac
}

useSSH() {
    AGENT_INFO=$(pgrep -fl ssh-agent | head -n 1)
    if [ -z "$AGENT_INFO" ]; then
        echo "creating new agent"
        eval "$(ssh-agent -s)"
    fi

    if [ -z "$SSH_AUTH_SOCK" ] || ! [ -e $SSH_AUTH_SOCK ]; then
        export SSH_AGENT_PID=$(echo $AGENT_INFO | awk '{print $2}')
        export SSH_AUTH_SOCK=$(ls -l /tmp/ssh-*/agent.* | grep $((SSH_AGENT_PID -1)) | awk '{print $9}')
        echo "Connected to ssh-agent: PID=$SSH_AGENT_PID, Socket=$SSH_AUTH_SOCK"
    fi

    ssh-add -l &>/dev/null
    if [ $? != 0 ]; then
        echo "adding keys"
        ssh-add
    else
        echo "all good"
    fi
}
