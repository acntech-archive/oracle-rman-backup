#/bin/bash

SCRIPT="$0"
SCRIPT_DIR="$( cd "$( dirname "${SCRIPT}" )"; pwd )"

. ${SCRIPT_DIR}/backup_env.sh

RMAN_SCRIPT_DIR="$( cd "${SCRIPT_DIR}/../rman"; pwd )"
RMAN_SCRIPT="${RMAN_SCRIPT_DIR}/${CONTROLFILE_BACKUP_RMAN_SCRIPT}"

if [ ! $( which rman > /dev/null 2>&1 ) ]; then
   echo "RMAN command not found. Cannot continue, exiting..."
   exit 1
fi

if [ ! -f "${RMAN_SCRIPT}" ]; then
   echo "RMAN script ${CONTROLFILE_BACKUP_RMAN_SCRIPT} does not exist. Cannot continue, exiting..."
   exit 1
fi

if [ ! -d "${CONTROLFILE_BACKUP_DIR}" ]; then
   echo "Backup directory ${CONTROLFILE_BACKUP_DIR} is missing. Creating it..."
   if [ ! mkdir -p "${CONTROLFILE_BACKUP_DIR}" > /dev/null 2>&1 ]; then
      echo "Unable to create backup directory ${CONTROLFILE_BACKUP_DIR}. Cannot continue, exiting..."
      exit 1
   fi
fi

rman target / cmdfile="${RMAN_SCRIPT}"