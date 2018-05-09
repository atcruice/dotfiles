#!/bin/bash

stty -ixon
shopt -s cdspell histappend no_empty_cmd_completion

export CDPATH=".:~:~/code/fivegoodfriends:~/code/alexcruice"
export CLICOLOR="1"
export EDITOR="vim"
GOPATH="$(go env GOPATH)"
export GOPATH
export HISTCONTROL="ignorespace:erasedups"
export HISTIGNORE="ls:bg:gf:history:exit"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export LESS="--ignore-case --squeeze-blank-lines --LONG-PROMPT --RAW-CONTROL-CHARS"
export PAGER="less"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH:$GOPATH/bin"
export PKG_CONFIG_PATH="/usr/X11/lib/pkgconfig:$PKG_CONFIG_PATH"
export TRAVELLING_RUBY_PACKAGE_DIR="$HOME/src"
GPG_TTY="$(tty)"
export GPG_TTY

export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"

source "/usr/local/etc/bash_completion"

source "/usr/local/opt/chruby/share/chruby/chruby.sh"
source "/usr/local/opt/chruby/share/chruby/auto.sh"

eval "$(direnv hook bash)"

# fzf via brew
source "/usr/local/opt/fzf/shell/completion.bash"
source "/usr/local/opt/fzf/shell/key-bindings.bash"

# use ag for fzf
if _has fzf && _has ag; then
    export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
fi
