#!/bin/bash

set -x

DIRBACKUP="/var/backup"
ACTUALDATE=$(echo $(date +%Y%m%d))
DIRAPOA="$DIRBACKUP/APOA"
DIRAFN="$DIRBACKUP/AFN"
DIRADCE="$DIRBACKUP/ADCE"
MYSQLDUMP="/usr/bin/mysqldump"
DUMPOPTIONS="--all-databases --single-transaction --skip-events"

dumpapoa(){

    HOSTSTAGIN="lessclickhml01.mysql.database.azure.com"
    USERSTAGIN="lessclickhml@lessclickhml01"
    HOSTPRODUCTION="lessclickdb01.mysql.database.azure.com"
    USERPRODUCTION="lessclick@lessclickdb01"

    cd $DIRAPOA

    expect -c 'spawn mysqldump --single-transaction --skip-events --all-databases --host='$HOSTSTAGIN' --user='$USERSTAGIN' -p > APOA_stagin-'$ACTUALDATE'.sql;
        expect : ;
        send "\$dun\@s\#20\@18\n";
        interact'

}

dumpapoa