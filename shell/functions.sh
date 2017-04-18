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
