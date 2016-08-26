#/bin/bash

SCRIPT="$0"
SCRIPT_DIR="$( cd "$( dirname "${SCRIPT}" )"; pwd )"

RMAN_SCRIPT_DIR="$( cd "${SCRIPT_DIR}/../rman"; pwd )"
RMAN_CMD="$( which rman 2> /dev/null )"

BACKUP_DIR="/var/backups/rman"
CONTROLFILE_BACKUP_DIR="${BACKUP_DIR}/controlfile"
ARCHIVELOG_BACKUP_DIR="${BACKUP_DIR}/archivelog"
DATABASE_BACKUP_DIR="${BACKUP_DIR}/database"

CONTROLFILE_BACKUP_RMAN_SCRIPT="controlfile_backup.rman"
CONTROLFILE_RESTORE_RMAN_SCRIPT="controlfile_restore.rman"
ARCHIVELOG_BACKUP_RMAN_SCRIPT="archivelog_backup.rman"
DATABASE_BACKUP_RMAN_SCRIPT="database_backup.rman"
DATABASE_RESTORE_RMAN_SCRIPT="database_restore.rman"
DATABASE_DAILY_BACKUP_RMAN_SCRIPT="database_daily_backup.rman"
DATABASE_WEEKLY_BACKUP_RMAN_SCRIPT="database_weekly_backup.rman"

CURRENT_CONTROLFILE_BACKUP="current_controlfile.bak"
CURRENT_ARCHIVELOG_BACKUP="current_controlfile.bak"
CURRENT_DATABASE_BACKUP="current_controlfile.bak"

if [ -z "${RMAN_CMD}" ] || [ ! -f "${RMAN_CMD}" ]; then
   echo "Error: RMAN command not found. Cannot continue, exiting..."
   exit 1
fi