#/bin/bash

SCRIPT="$0"
SCRIPT_DIR="$( cd "$( dirname "${SCRIPT}" )"; pwd )"

. ${SCRIPT_DIR}/backup_env.sh

${SCRIPT_DIR}/run_backup.sh "${DATABASE_WEEKLY_BACKUP_RMAN_SCRIPT}" "${DATABASE_BACKUP_DIR}"