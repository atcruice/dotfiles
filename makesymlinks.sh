#!/bin/bash
# creates symlinks from home directory to dotfiles in ~/dotfiles
# courtesy: github.com/michaeljsmalley/dotfiles

dir=~/dotfiles # dotfiles directory
olddir=~/dotfiles_old # old dotfiles backup directory
# list of files/folders to symlink in homedir
files="bash_profile bashrc clang-format gitconfig gitignore_global vimrc"

# create backup directory
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move existing dotfiles in ~ to backup directory
# create symlinks from ~ to files in ~/dotfiles specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
