EDITOR='nvim'

# history
HISTFILE=$HOME/.zsh_history

function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

zsh_add_file "exports.zsh"
zsh_add_file "options.zsh"
zsh_add_file "scripts.zsh"

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

autoload -Uz compinit && compinit
_comp_options+=(globdots) # With hidden files
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

# set vi mode
bindkey -v
export KEYTIMEOUT=1 # switching modes is faster
zsh_add_file "plugins/cursor.zsh"

[ -f "$HOME/workconfig.zsh" ] && source "$HOME/workconfig.zsh"

eval "$(starship init zsh)"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
