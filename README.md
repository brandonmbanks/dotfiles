# Dotfiles

Uses GNU stow which is a symlink manager to easily setup and manage dotfiles on a system.

Install stow with:
```
brew install stow
```

Clone the repo in your home directory:
```
git clone git@github.com:brandonmbanks/dotfiles.git
```

cd into the repo and stow.
```
cd dotfiles
stow .
```

Stow will error when files on your computer have identical locations and names to files in the `dotfiles` directory. Stow doesn’t want to overwrite your local files.

Back up the files if they’re useful, delete them if they aren’t.

Run `stow .` again until you don’t get any errors.

You can also use `stow --adopt .` to move the conflicting file into the `dotfiles` directory. This will overwrite the file in the `dotfiles` directory.

Your dotfile setup is complete!

Treat your dotfile management system is like any other Git project. Make any changes in the `dotfiles` directory.

### Work config file
Create a file in your home directory called `workconfig.zsh`. Here you will add any exports or PATH changes only needed for a work machine.

```
touch ~/workconfig.zsh
```
