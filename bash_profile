[[ -s "$HOME/.bashrc" ]] && source ~/.bashrc

if [[ -f $(brew --prefix)/share/bash-completion/bash_completion ]]; then
  . "$(brew --prefix)/share/bash-completion/bash_completion"
fi

eval "$(direnv hook $0)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
