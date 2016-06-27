stty -ixon
shopt -s cdspell histappend no_empty_cmd_completion

export CLICOLOR=1
export EDITOR='vim -f'
export HISTCONTROL=ignorespace:erasedups
export HISTIGNORE='ls:bg:gf:history:exit'
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig:$PKG_CONFIG_PATH
export TRAVELLING_RUBY_PACKAGE_DIR="$HOME/src"

source "$(brew --prefix)/etc/bash_completion"
source '/usr/local/opt/chruby/share/chruby/chruby.sh'
source '/usr/local/opt/chruby/share/chruby/auto.sh'

eval "$(direnv hook bash)"

alias be="bundle exec "
