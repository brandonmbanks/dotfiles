mkcd() {
  mkdir -p -- "$1" && cd -P "$1"
}

gidtok() {
    tok=$(gcloud auth print-identity-token | tr -d '\n')
    echo -n $tok | pbcopy
    export GID_TOKEN=$tok
}

ssh_create() {
    if [ ! -z "$1" ]; then
        ssh-keygen -f $HOME/.ssh/$1 -t ed25519 -N '' -C "$1"
        chmod 600 $HOME/.ssh/$1
        chmod 644 $HOME/.ssh/$1.pub
    fi
}

ports() {
    sudo lsof -iTCP -sTCP:LISTEN -n -P | fzf;
}

zshcomp() {
    for command completion in ${(kv)_comps:#-*(-|-,*)}
    do
        printf "%-32s %s\n" $command $completion
    done | sort
}

back() {
    for file in "$@"; do
        cp "$file" "$file".bak
    done
}

install_nvim() {
    local nvim_dir="$HOME/projects/neovim"
    if [ ! -d "$nvim_dir" ]; then
        echo "Error: $nvim_dir not found"
        return 1
    fi
    cd "$nvim_dir" \
        && make distclean \
        && make CMAKE_BUILD_TYPE=Release \
        && sudo make install \
        && echo "Neovim installed successfully: $(nvim --version | head -1)"
}

