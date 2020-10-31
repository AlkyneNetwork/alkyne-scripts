ensure_directories() {
    if [[ ! -e $PWD/plugins ]]; then
        echo error: no plugin directory!
        exit
    elif [[ ! -e $PWD/servers ]]; then
        echo error: no server directory!
        exit
    fi
}
