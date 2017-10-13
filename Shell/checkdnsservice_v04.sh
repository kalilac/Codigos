#!/bin/bash

#set -x

TEST="True"
DNSSERVER="192.168.222.100"
logfile="/var/log/logdnscheck.log"
NAMESITES=("www.uol.com.br" "www.google.com.br" "www.ig.com.br" "terra.com.br" "www.yahoo.com.br" "youtube.com" "www.intel.com" "g1.com.br" "facebook.com" "amd.com")
queryanser="null"
answerproblem="False"
birdstoped="False"
trycheck=1

startservice(){
	
	sudo systemctl start $1
	
}

stopservices(){
	
	sudo systemctl stop $1

}

restartservice(){
	
	sudo systemctl restart $1

}

doaquery(){

	idquery=$((1 + RANDOM % 10))
    askquery=$(echo ${NAMESITES[$idquery]})
    queryanswer=$(dig +short +retry=0 +timeout=0 @$DNSSERVER $askquery | tail -1)

}

checkanswer(){

	doaquery

    if [ -z $queryanswer ] || [[ $queryanswer == ";; connection timed out; no servers could be reached" ]]; then

    	stopservices bird
    	restartservice named

    	answerproblem="True"
    	birdstoped="True"

    else

    	answerproblem="False"

    fi

}

simplecheckwanser(){

    doaquery

    if [ -z $queryanswer ] || [[ $queryanswer == ";; connection timed out; no servers could be reached" ]]; then

    	answerproblem="True"

    else

    	answerproblem="False"

    fi

}

forcefix(){

	trycheck=1

	while [ $trycheck -lt 5 ];

    		    do

    		    	checkanswer
    		    	sleep 2
    		    	echo "$(date "+%d/%m/%Y %H:%M:%S") - problema no DNS. Try to fix #$trycheck" >> $logfile

    		    	if [ $answerproblem == "False" ]; then

    		    		trycheck=5

    		    	fi

    		    	trycheck=$(($trycheck+1))

    		    done;

}

while [ $TEST == "True" ];
    
    do

    	simplecheckwanser
    	newchecks=0

    	if [ $answerproblem == "True" ]; then

    		while [ $newchecks -lt 3 ];

    		    do
    		    	simplecheckwanser

    		    	if [ $answerproblem == "True" ]; then

    		    		newchecks=$(($newchecks+1))

    		    		if [ $newchecks -eq 3 ]; then

    		    			forcefix

    		    		fi

    		    	else

    		    		newchecks=5

    		    	fi

    		    done;

        fi

        if [ $trycheck -eq 5 ] && [[ $answerproblem == "True" ]]; then

        	echo "$(date "+%d/%m/%Y %H:%M:%S") - problema no DNS. Was not possible to fix. Stopping and exit" >> $logfile
        	stopservices named
        	TEST="False"
        	stopservices checkdnsservice

        elif [[ $birdstoped == "True" ]]; then

        	echo "$(date "+%d/%m/%Y %H:%M:%S") - DNS working fine. Starting bird service" >> $logfile
        	startservice bird
        	birdstoped="False"

        fi

        sleep 5

    done
