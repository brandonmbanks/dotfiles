export EDITOR='nvim'
export VISUAL='nvim'

export HISTFILE="$ZDOTDIR/.zsh_history" # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
export HISTORY_IGNORE="(ls:pwd:gcaa *:gcmsg *:c:gss)"

export VIMCONFIG="$XDG_CONFIG_HOME/nvim"

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND="fd -t d --hidden --exclude $HOME/Library . $HOME"

# golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$GOBIN:$PATH"

# path
export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH

# Man pages
export MANPAGER='nvim +Man!'

# flutter
export PATH="$HOME/projects/flutter/bin:$PATH"
