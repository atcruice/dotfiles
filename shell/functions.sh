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
