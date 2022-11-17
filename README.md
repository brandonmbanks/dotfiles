# Dotfiles

Originally, I had my dotfiles broken into many repos. This repo was created following This [guide](https://www.atlassian.com/git/tutorials/dotfiles).
By having the workspace exist outside of the repo it removes the need for symlinks or extra tooling. Setup is also easy on a new machine.

## Install dotfiles on a new system, or migrate to this setup
1. `echo ".dotfiles" >> .gitignore`
Avoid any weird recursion where .dotfiles tries to track itself.

1. `git clone --bare git@github.com:brandonmbanks/dotfiles.git $HOME/.dotfiles`

2. `alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'`

3. `dot config --local status.showUntrackedFiles no`
Set a local configuration in .dotfiles to ignore untracked files.

4. `dot checkout`
Checkout the actual content from your .dotfiles repository to $HOME. Git pulls the tracked files out of the compressed database in the Git directory and places them in the work tree.

E.g if you added $HOME/.aliases to .dotfiles, that file will be instantiated at that path on your new computer. Ta Da!

`dot checkout` might fail with a message like:
Files on your computer might have identical locations and names to files in the .dotfiles repo. Git doesn’t want to overwrite your local files.

Back up the files if they’re useful, delete them if they aren’t.

Run `dot checkout` again until you don’t get any errors.

Your dotfile setup is complete!

Treat your dotfile management system is like any other Git project. Just use the `dot` alias to add, commit, push and pull.

