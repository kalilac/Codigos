#!/bin/bash

set -x

DIRBACKUP="/var/backup"
ACTUALDATE=$(echo $(date +%Y%m%d))
DIRAPOA="$DIRBACKUP/APOA"
DIRAFN="$DIRBACKUP/AFN"
DIRADCE="$DIRBACKUP/ADCE"

dumpapoa(){

    HOSTSTAGIN="lessclickhml01.mysql.database.azure.com"
    USERSTAGIN="lessclickhml@lessclickhml01"
    HOSTPRODUCTION="lessclickdb01.mysql.database.azure.com"
    USERPRODUCTION="lessclick@lessclickdb01"

    cd $DIRAPOA

    expect -c 'spawn mysqldump --all-databases --single-transaction --skip-events --host='$HOSTSTAGIN' --user='$USERSTAGIN' -p > APOA_stagin-'$ACTUALDATE'.sql;
        expect : ;
        send "abcdsss\n";
        interact'

}

dumpapoa