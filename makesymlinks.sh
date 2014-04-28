#!/bin/bash
# creates symlinks from home directory to dotfiles in ~/dotfiles
# courtesy: github.com/michaeljsmalley/dotfiles

dir=~/dotfiles # dotfiles directory
olddir=~/dotfiles_old # old dotfiles backup directory
# list of files to symlink in homedir
files="alexcruice.zsh-theme bash_profile bashrc clang-format gitconfig gitignore_global vimrc zshrc"

# create backup directory
echo -n "Creating $olddir for backup of existing dotfiles ..."
mkdir -p $olddir
echo "done"

cd $dir

# move existing dotfiles in ~ to backup directory
# create symlinks from ~ to files in ~/dotfiles specified in $files
echo "Moving existing dotfiles to $olddir"
for file in $files; do
    mv ~/.$file ~/dotfiles_old/$file
    echo "Creating symlink to $file in ~"
    ln -s $dir/$file ~/.$file
done
# workaround for zsh theme
rm ~/.alexcruice.zsh-theme
cp ~/dotfiles/alexcruice.zsh-theme ~/.oh-my-zsh/themes/
