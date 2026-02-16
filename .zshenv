export EDITOR='nvim'
export VISUAL='nvim'

# xdg
export XDG_CONFIG_HOME=$HOME/.config

# zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

export VIMCONFIG="$XDG_CONFIG_HOME/nvim"

# golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

# volta
export VOLTA_HOME="$HOME/.volta"

export COMPOSE_BAKE=true

# path
export PATH="$GOBIN:$PATH"
export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/.temporalio/bin/:$PATH
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"
