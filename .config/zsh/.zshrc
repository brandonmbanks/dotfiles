# history
export HISTFILE=$HOME/.zsh_history
HISTSIZE=10100 # Maximum events for internal history
SAVEHIST=10000 # Maximum events in history file
HISTORY_IGNORE="(ls:pwd:gcaa *:gcmsg *:c:gss)"

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
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "hlissner/zsh-autopair"

# rust
[ -f $HOME/.cargo/env ] && . $HOME/.cargo/env

# asdf
[ -f $HOME/.asdf/asdf.sh ] && . $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# fzf
source <(fzf --zsh)

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

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

eval "$(starship init zsh)"

eval "$(zoxide init --cmd cd zsh)"
