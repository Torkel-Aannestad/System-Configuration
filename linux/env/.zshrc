
#oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export XDG_CONFIG_HOME=$HOME/.config

#config
[[ -f $XDG_CONFIG_HOME/zsh-config/functions.sh ]] && source "$XDG_CONFIG_HOME/zsh-config/functions.sh"
[[ -f $XDG_CONFIG_HOME/zsh-config/path.sh ]] && source "$XDG_CONFIG_HOME/zsh-config/path.sh"
[[ -f $XDG_CONFIG_HOME/zsh-config/aliases.sh ]] && source "$XDG_CONFIG_HOME/zsh-config/aliases.sh"

#fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

export FZF_DEFAULT_COMMAND='fd . --type f --hidden -exclude .git --exclude node_modules' #--color=never --hidden
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --style=plain --color=always --line-range :50 {}'" #--walker-skip .git,node_modules,target

export FZF_ALT_C_COMMAND='fd . --type d --hidden -exclude .git --exclude node_modules' #--color=never --hidden
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"
