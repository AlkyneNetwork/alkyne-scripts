# !/bin/bash
alkyne_script_path=$PWD/backup

# load commands
for script in $alkyne_script_path/scripts/{help,status}.sh; do
    source $script
done

case $1 in
    "" | "--help")
        print_help
        ;;
    "status")
        backup_status $@
        ;;
    *)
        print_help
        ;;
esac
