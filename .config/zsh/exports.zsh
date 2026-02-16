# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND="fd -t d --hidden --exclude $HOME/Library -E vendor -d 7 . $HOME"

# Man pages
export MANPAGER='nvim +Man!'
