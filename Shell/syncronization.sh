#!/bin/bash

#set -x 

LOGFILE=/var/log/syncronization.log

makebackup(){

	cp /webdir/arenaweb/.ssh/known_hosts /tmp
	rsync -avzhe "sshpass -p P?bTXP%_^F58Jj9D ssh -p 2221"  arenaweb@arenadunas1.dedi.gblix.network:/webdir/arenaweb /webdir
	cp -f /tmp/known_hosts /webdir/arenaweb/.ssh/known_hosts

}

ping -c 1 arenadunas1.dedi.gblix.network

if [ $? -eq 0 ]; then

    makebackup
    echo "$(date): Sincronização realizada com sucesso!" >> $LOGFIL

else

	echo "$(date): Servidor não responde. Verificar o que está ocorrendo" >> $LOGFILE

fi


