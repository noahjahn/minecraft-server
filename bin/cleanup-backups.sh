#!/bin/bash

BACKUP_DIR=$1

if [ -z "$BACKUP_DIR" ]; then
    printf "Usage:\t cleanup-backups.sh path/to/backups\n"
    exit 2;
fi

find $BACKUP_DIR -mindepth 1 -maxdepth 1 -not -name "$(date -d '-2 day' '+%Y-%m-%d')*" -a -not -name "$(date -d '-1 day' '+%Y-%m-%d')*" -a -not -name "$(date '+%Y-%m-%d')*" -exec rm -rf {} \;
