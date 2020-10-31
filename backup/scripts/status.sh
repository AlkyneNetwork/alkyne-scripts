alkyne_backup_service_names=("restic-backup" "restic-check")

backup_status() {
    error=0
    for service in "${alkyne_backup_service_names[@]}"; do
        if [[ ! -e /etc/system.d/system/$service.service ]]; then
            echo error: service $service does not exist.
            error=1
        fi
    done

    for timer in "${alkyne_backup_service_names[@]}"; do
        if [[ ! -e /etc/system.d/system/$timer.timer ]]; then
            echo error: timer $timer does not exist.
            error=1
        fi
    done

    if [[ $error -eq 1 ]]; then
        echo error: at least one service/timer could not be found - cannot check status from systemd
        exit 1;
    fi

    systemctl status restic-backup.service restic-check.service restic-backup.timer restic-check.timer
}
