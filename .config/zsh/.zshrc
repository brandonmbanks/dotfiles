EDITOR='nvim'

# history
HISTFILE=$HOME/.zsh_history

function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

zsh_add_file "exports.zsh"
zsh_add_file "options.zsh"

# aliases
[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# plugins
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
zapplug "zsh-users/zsh-autosuggestions"
zapplug "zsh-users/zsh-syntax-highlighting"
zapplug "hlissner/zsh-autopair"

# rust
. "$HOME/.cargo/env"

# asdf
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit && compinit

[ -f "$HOME/workconfig.zsh" ] && source "$HOME/workconfig.zsh"

eval "$(starship init zsh)"

