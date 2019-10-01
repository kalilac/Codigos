#!/bin/bash

set -x

SSHPASS='less91CliCk02!)'
CLIENTSFILE="/root/scripts/clients.txt"
CLIENT=NULL
ACTUALDATE=$(echo $(date +%Y%m%d))
ROOTBACKUP="/var/backup/servicos"
DIRBACKUP="$ROOTBACKUP/$ACTUALDATE"
MTCOMMAND="/usr/bin/mt -f"
MTXCOMMAND="/usr/sbin/mtx -f"
DRIVER1="/dev/tape/by-id/scsi-35000e11159586004-nst"
CHANGER="/dev/tape/by-id/scsi-1IBM_3573-TL_00X4U78T8067_LL0"

export SSHPASS

systembackup(){

	mkdir -p $DIRBACKUP/$CLIENT
	rsync -avzhe "sshpass -v -e ssh -p 22" root@$CLIENT:"/var/www /var/lib/mysql /etc/apache2" $DIRBACKUP/$CLIENT

}

copytotape(){

	ACTUALDAY=$(echo $(date +%a))

	if [ $ACTUALDAY == "Sun" ]; then

	    $MTXCOMMAND $CHANGER load 25 1
	    $MTCOMMAND $DRIVER1 rewind

	elif [ $ACTUALDAY == "Seg" ]; then

		$MTXCOMMAND $CHANGER load 26 1
	    $MTCOMMAND $DRIVER1 rewind

	elif [ $ACTUALDAY == "Ter" ]; then

		$MTXCOMMAND $CHANGER load 27 1
	    $MTCOMMAND $DRIVER1 rewind

	elif [ $ACTUALDAY == "Qua" ]; then

		$MTXCOMMAND $CHANGER load 28 1
	    $MTCOMMAND $DRIVER1 rewind

	elif [ $ACTUALDAY == "Qui" ]; then

		$MTXCOMMAND $CHANGER load 38 1
	    $MTCOMMAND $DRIVER1 rewind

	elif [ $ACTUALDAY == "Sex" ]; then

		$MTXCOMMAND $CHANGER load 39 1
	    $MTCOMMAND $DRIVER1 rewind

	elif [ $ACTUALDAY == "Sab" ]; then

		$MTXCOMMAND $CHANGER load 40 1
	    $MTCOMMAND $DRIVER1 rewind

	fi		


	tar -cf $DRIVER1 $DIRBACKUP

}

removedirectory(){

	OLDDATE=$(($ACTUALDATE-15))

	ls -1 $ROOTBACKUP | sort -n > /tmp/listdir
	for OLDEST in $(cat /tmp/listdir);

	    do

	    	if [ $OLDEST -eq $OLDDATE ];

	    		rm -rf $ROOTBACKUP/$OLDEST
	    	    break
	
	    	fi
	
	    done

}


for CLIENT in $(cat $CLIENTSFILE);

    do

    	echo $CLIENT
    	#systembackup
    	#copytotape
    	#removedirectory
    
    done