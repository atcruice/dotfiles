#!/bin/bash

function vimplug {
    if [[ -n $1 ]]
    then
        case $1 in
            update | upgrade)
                vim +PlugUpdate +PlugClean! +PlugUpgrade +qall;;
            refresh)
                vim +PlugInstall +qall;;
            *)
                echo "Unknown command: $1"
        esac
    fi
}

function _pip_completion {
    COMPREPLY=($(COMP_WORDS="${COMP_WORDS[*]}" COMP_CWORD=$COMP_CWORD PIP_AUTO_COMPLETE=1 $1))
}
complete -o default -F _pip_completion pip

function gemscrub {
    gem pristine --all --env-shebang --no-extensions
}

# credit https://www.bhalash.com/archives/13544809048
function _has {
    for PROGRAM in "$@"; do
        if [[ $(which "$PROGRAM" &>/dev/null; echo $?) != 0 ]]; then
            return 1
        fi
    done

    return 0
}
