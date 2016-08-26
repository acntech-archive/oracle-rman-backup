#/bin/bash

SCRIPT="$0"
SCRIPT_DIR="$( cd "$( dirname "${SCRIPT}" )"; pwd )"

. ${SCRIPT_DIR}/backup_env.sh

RMAN_SCRIPT="${RMAN_SCRIPT_DIR}/${CONTROLFILE_RESTORE_RMAN_SCRIPT}"

RMAN_BACKUP_DIR="${CONTROLFILE_BACKUP_DIR}"
CURRENT_BACKUP_FILE="${RMAN_BACKUP_DIR}/${CURRENT_CONTROLFILE_BACKUP}"

FIND_BACKUP_FILE="$( ls -t ${RMAN_BACKUP_DIR}/*.bak 2> /dev/null | head -1 )"
LATEST_BACKUP_FILE="${RMAN_BACKUP_DIR}/${FIND_BACKUP_FILE}"

if [ ! $( which rman > /dev/null 2>&1 ) ]; then
   echo "Error: RMAN command not found. Cannot continue, exiting..."
   exit 1
fi

if [ ! -f "${RMAN_SCRIPT}" ]; then
   echo "Error: RMAN script ${RMAN_SCRIPT} does not exist. Cannot continue, exiting..."
   exit 1
fi

if [ ! -d "${RMAN_BACKUP_DIR}" ]; then
   echo "Error: Backup directory ${RMAN_BACKUP_DIR} does not exist. Cannot continue, exiting..."
   exit 1
fi

if [ -z "${FIND_BACKUP_FILE}" ] || [ ! -f "${LATEST_BACKUP_FILE}" ]; then
   echo "Error: No backup files exist. Cannot continue, exiting..."
   exit 1
fi

if [ ! cp -f "${LATEST_BACKUP_FILE}" "${CURRENT_BACKUP_FILE}" ]; then
   echo "Error: Unable to copy latest backup file for restore. Cannot continue, exiting..."
   exit 1
fi

#${RMAN_CMD} target / cmdfile="${RMAN_SCRIPT}"