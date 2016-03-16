stty -ixon
shopt -s cdspell histappend no_empty_cmd_completion

export CLICOLOR=1
export EDITOR='vim -f'
export HISTCONTROL=ignorespace:erasedups
export HISTIGNORE='ls:lsl:bg:gf:history:exit'
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
path_front '/usr/local/bin' '/usr/local/sbin'
export PATH

source "$(brew --prefix)/etc/bash_completion"
source '/usr/local/opt/chruby/share/chruby/chruby.sh'
source '/usr/local/opt/chruby/share/chruby/auto.sh'

eval "$(direnv hook bash)"
