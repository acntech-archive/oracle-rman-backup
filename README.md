# oracle-rman-backup
Oracle RMAN backup and restore scrips

## Prerequisites
The use that is to run the RMAN scripts must be allowed to access the RMAN CLI, i.e. must typically be part of the dba Linux group on the database machine.

For being able to run scripts using SSH the SSH public key (~/.ssh/id_rsa.pub) of the caller should be added to the authorized keys file (~/.ssh/authorized_keys) of the RMAN user on the database machine.

This Git repo should be cloned into the database machine (or made available on the database machine by other means).
```
git clone https://github.com/acntech/oracle-rman-backup.git /tmp/oracle-rman-backup
```

## Running daily database backup
BASH
```
/tmp/oracle-rman-backup/bin/run_database_daily_backup.sh
```
SSH
```
ssh oracle@localhost 'export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe; export PATH=$ORACLE_HOME/bin:$PATH; export ORACLE_SID=XE; export NLS_DATE_FORMAT="DD-MM-RRRR HH24:MI:SS"; /tmp/oracle-rman-backup/bin/run_database_daily_backup.sh'
```

## Running weekly database backup
BASH
```
/tmp/oracle-rman-backup/bin/run_database_weekly_backup.sh
```
SSH
```
ssh oracle@localhost 'export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe; export PATH=$ORACLE_HOME/bin:$PATH; export ORACLE_SID=XE; export NLS_DATE_FORMAT="DD-MM-RRRR HH24:MI:SS"; /tmp/oracle-rman-backup/bin/run_database_weekly_backup.sh'
```

## Running controlfile backup
BASH
```
/tmp/oracle-rman-backup/bin/run_controlfile_backup.sh
```
SSH
```
ssh oracle@localhost 'export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe; export PATH=$ORACLE_HOME/bin:$PATH; export ORACLE_SID=XE; export NLS_DATE_FORMAT="DD-MM-RRRR HH24:MI:SS"; /tmp/oracle-rman-backup/bin/run_controlfile_backup.sh'
```

## Running database restore
BASH
```
/tmp/oracle-rman-backup/bin/run_database_restore.sh
```
SSH
```
ssh oracle@localhost 'export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe; export PATH=$ORACLE_HOME/bin:$PATH; export ORACLE_SID=XE; export NLS_DATE_FORMAT="DD-MM-RRRR HH24:MI:SS"; /tmp/oracle-rman-backup/bin/run_database_restore.sh'
```