#!/bin/bash
# creates symlinks from home directory to dotfiles in ~/dotfiles
# courtesy: github.com/michaeljsmalley/dotfiles

# before
# \curl -L http://install.ohmyz.sh | sh
# \wget --no-check-certificate http://install.ohmyz.sh -O - | sh

dir=~/dotfiles # dotfiles directory
olddir=~/dotfiles_old # old dotfiles backup directory
# list of files to symlink in homedir
files="bash_profile bashrc clang-format gemrc gitconfig gitignore_global profile rvmrc vimrc zlogin zshrc"

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

# link zsh theme
ln -s ~/dotfiles/alexcruice.zsh-theme ~/.oh-my-zsh/themes/
