stty -ixon
shopt -s cdspell histappend no_empty_cmd_completion

export CLICOLOR=1
export EDITOR='vim -f'
export HISTCONTROL=ignorespace:erasedups
export HISTIGNORE='ls:lsl:bg:gf:history:exit'
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
path_front '/usr/local/bin' '/usr/local/sbin'
export PATH

source_this "$(brew --prefix)/etc/bash_completion" 'bash-completion not found'
source_this '/usr/local/opt/chruby/share/chruby/chruby.sh' 'chruby failed to load'
source_this '/usr/local/opt/chruby/share/chruby/auto.sh' 'chruby auto-loading failed to load'

eval "$(direnv hook bash)"
