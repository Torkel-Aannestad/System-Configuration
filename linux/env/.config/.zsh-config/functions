#!/usr/bin/bash

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

validateYaml() {
    python -c 'import yaml,sys;yaml.safe_load(sys.stdin)' < $1
}

useSSH() {
    AGENT_INFO=$(ps -ef | grep "ssh-agent" | grep -v "grep" | head -n 1)
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

#Change Directory
fd() {
  DIR=`find * -maxdepth 1 -type d | fzf` \
    && cd "$DIR"
}
#find project
fp(){
    DIR=`find ~/projects/ ~/projects/bootdotdev/ ~/projects/test-projects/ ~/projects/frontend-masters -mindepth 1 -maxdepth 1 -type d | fzf `\
    && cd "$DIR"
}
