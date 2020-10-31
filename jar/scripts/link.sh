print_link_help() {
    echo "Link jars found in the plugins folder to valid servers"
    echo
    echo "usage: jar link [--help]"
    echo
}

link_bukkit_jars() {
    echo info: linking bukkit jars...
    for bukkitYamlPath in $PWD/servers/*/bukkit.yml; do
        pluginDirectory=${bukkitYamlPath%bukkit.yml}plugins
        for file in $PWD/plugins/bukkit/*.jar; do
            echo info: Linking plugin ${file##*/}...
            target=$pluginDirectory/${file##*/}
            (set -xe ; cp $file $target; chown pterodactyl:pterodactyl $target; chmod 644 $target)
            echo 
       done
    done
}

link_bungee_jars() {
    echo info: linking bungee jars...
    for bungeeYamlPath in $PWD/servers/*/config.yml; do
        pluginDirectory=${bungeeYamlPath%config.yml}plugins
        for file in $PWD/plugins/bungee/*.jar; do
            echo info: Linking plugin ${file##*/}...
            target=$pluginDirectory/${file##*/}
            (set -xe; cp $file $target; chown pterodactyl:pterodactyl $target; chmod 644 $target)
        done
    done
}

link_jars() {
    if [[ $2 == "--help" ]]; then
        print_link_help
        exit
    fi

    echo info: removing existing jars...
    ensure_directories

    # remove existing plugins
    shopt -s nullglob
    for file in $PWD/servers/*/plugins/*.jar; do
        (set -xe ; rm $file)
    done

    echo
    link_bukkit_jars
    echo
    link_bungee_jars
    echo

    echo info: jars linked.
}
