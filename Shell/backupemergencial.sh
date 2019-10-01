#!/bin/bash

#set -x

ARQUIVOSWITCH=/tmp/lista_switchs.txt
BACKUPSWUTCH=/var/lib/tftpboot/
SWITCHS=null

backupSwitch(){
    
    expect -c 'spawn ssh -oStrictHostKeyChecking=no -p 22 kalil.solutis@'$SWITCHS';
        expect : ;
        send "\n";
        expect : ;
        send "kalil@arenadunas\n";
		expect #;
		send "copy running-config tftp://10.102.10.208/'$SWITCHS'\n";
		expect ?;
		send "\n";
		expect ?;
		send "\n";
		expect #;
		send "exit\n";
    interact'
}


    for switch in $(cat $ARQUIVOSWITCH);
      
        do
		    ping -c 1 -W 2 $switch

		    if [ $? -eq 0 ]; then
	            
	            touch $BACKUPSWUTCH/$switch
	            chmod -R 777 $BACKUPSWUTCH
	            #echo "$switch"
				SWITCHS=$switch
				sleep 3
				backupSwitch

		    fi;

	done

