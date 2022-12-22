ssh_create() {
    if [ ! -z "$1" ]; then
        ssh-keygen -f $HOME/.ssh/$1 -t ed25519 -N '' -C "$1"
        chmod 700 $HOME/.ssh/$1*
    fi
}

ports() {
    sudo netstat -tulpn | grep LISTEN | fzf;
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

