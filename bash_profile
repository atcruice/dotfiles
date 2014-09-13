[[ -s "$HOME/.bashrc" ]] && source ~/.bashrc

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

eval "$(direnv hook $0)"
