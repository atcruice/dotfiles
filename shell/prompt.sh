#!/bin/bash

# Terminfo escape aliases
RESET="\[$(tput sgr0)\]"
# BLACK="\[$(tput setaf 0)\]"
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
# BLUE="\[$(tput setaf 4)\]"
MAGENTA="\[$(tput setaf 5)\]"
CYAN="\[$(tput setaf 6)\]"
# WHITE="\[$(tput setaf 7)\]"

function ruby_version {
    if [[ -n $RUBY_VERSION ]]; then
        echo -e "$RED$RUBY_VERSION "
    fi
}

function git_branch_dirty {
    # check in repo
    git rev-parse --is-inside-work-tree &>/dev/null || return

    # just branch name
    local branch
    # branch=$(git rev-parse --abbrev-ref HEAD)
    branch=$(git branch | sed -n '/\* /s///p')

    # dirty mark https://github.com/sindresorhus/pure
    local dirty
    dirty=$(test -n "$(command git status --porcelain --ignore-submodules --untracked-files=normal)" && echo "*")

    echo -e "$YELLOW$branch$dirty "
}

function exit_code_zero {
    echo -e "$CYAN\w $(ruby_version)$(git_branch_dirty)$GREEN\$ $RESET"
}

function exit_code_nonzero {
    echo -e "$CYAN\w $(ruby_version)$(git_branch_dirty)$RED\$ $RESET"
}

function set_PS1 {
    if [[ $? == 0 ]]; then
        PS1=$(exit_code_zero)
    else
        PS1=$(exit_code_nonzero)
    fi
}

PROMPT_COMMAND="set_PS1; history -a; $PROMPT_COMMAND"
