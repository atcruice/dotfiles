#!/bin/bash
# creates symlinks from home directory to dotfiles in ~/dotfiles
# courtesy: github.com/michaeljsmalley/dotfiles

dir=~/dotfiles # dotfiles directory
olddir=~/dotfiles_old # old dotfiles backup directory
# list of items to symlink in homedir
items="bash_profile bashrc clang-format gitconfig gitignore_global oh-my-zsh vimrc zshrc"

# create backup directory
echo -n "Creating $olddir for backup of existing dotfiles ..."
mkdir -p $olddir
echo "done"

cd $dir

# move existing dotfiles in ~ to backup directory
# create symlinks from ~ to items in ~/dotfiles specified in $items
echo "Moving existing dotfiles to $olddir"
for item in $items; do
    mv ~/.$item ~/dotfiles_old/$item
    echo "Creating symlink to $item in ~"
    ln -s $dir/$item ~/.$item
done
