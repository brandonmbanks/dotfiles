export VIMCONFIG="$XDG_CONFIG_HOME/nvim"

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND="fd -t d --hidden --exclude $HOME/Library -E vendor -d 7 . $HOME"

# golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$GOBIN:$PATH"

# path
export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/.temporalio/bin/:$PATH

# Man pages
export MANPAGER='nvim +Man!'

export COMPOSE_BAKE=true
