#!/usr/bin/env bash

while true; do
    rclone sync \
        --backup-dir "${RCLONE_BACKUP}$(date +%Y-%m-%d)" \
        "--config=${RCLONE_CONFIG_DIR}/rclone.conf" \
        --bwlimit "06:00,125 00:30,off" \
        --dscp LE \
        --exclude-if-present .no_backup \
        --delete-excluded \
        --delete-during \
        "${RCLONE_SOURCE}" \
        "${RCLONE_DESTINATION}"

    difference=$(($(date -d "${RCLONE_TIME}" +%s) - $(date +%s)))

    if [ $difference -lt 0 ]
    then
        sleep $((86400 + difference))
    else
        sleep $difference
    fi    

done
