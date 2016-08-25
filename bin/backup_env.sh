#/bin/bash

BACKUP_DIR="/var/backups/rman"
CONTROLFILE_BACKUP_DIR="${BACKUP_DIR}/controlfile"
ARCHIVELOG_BACKUP_DIR="${BACKUP_DIR}/archivelog"
DATABASE_BACKUP_DIR="${BACKUP_DIR}/database"

CONTROLFILE_BACKUP_RMAN_SCRIPT="controlfile_backup.rman"
ARCHIVELOG_BACKUP_RMAN_SCRIPT="archivelog_backup.rman"
DATABASE_BACKUP_RMAN_SCRIPT="database_backup.rman"