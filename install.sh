#!/bin/bash

dotfiles_dir="$HOME/.dotfiles"
dotfiles_backup="$HOME/.dotfiles_backup"
files="bash_profile bashrc clang-format freshrc gitconfig gitignore jrubyrc rubocop.yml rvmrc tmux.conf vimrc"

echo "Creating dotfiles backup directory"
mkdir -pv "$dotfiles_backup"
cd "$dotfiles_dir"
echo "Avoid clobbering existing dotfiles by moving them to $dotfiles_backup"
for file in $files; do
    mv -iv "$HOME/.$file" "$dotfiles_backup/$file"
done

ln -isv "$dotfiles_dir/bashrc" "$HOME/.bashrc"
bash -c "$(curl -sL get.freshshell.com)"
rm -fv .freshrc
ln -isv "$dotfiles_dir/freshrc" "$HOME/.freshrc"
