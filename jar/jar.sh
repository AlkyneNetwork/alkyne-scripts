# !/bin/bash
alkyne_script_path=$PWD/jar

# load commands
for script in $alkyne_script_path/scripts/{files,help,link}.sh; do
    source $script
done

case $1 in
    "" | "--help")
        print_help
        ;;
    "link")
        link_jars $@
        ;;
    "status")
        status_jars $@
        ;;
    *)
        print_help
        ;;
esac
