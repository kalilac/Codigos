#!/bin/bash

set -x

TEST="True"
DNSSERVER="192.168.222.100"
NAMESFILE="/tmp/names.txt"
queryanser="null"
answerproblem="False"
birdstoped="False"

startservice(){
	
	systemctl start $1
	
}

stopservices(){
	
	systemctl stop $1

}

restartservice(){
	
	systemctl restart $1

}

doaquery(){

	idquery=$((1 + RANDOM % 5))
    askquery=$(sed ''$idquery'q;d' $NAMESFILE)
    #queryanswer=$(dig +short @$DNSSERVER $askquery | awk '{ print $2 }' | tail -1)
    queryanswer=$(dig +short @$DNSSERVER $askquery | tail -1)

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


while [ $TEST == "True" ];
    
    do

    	checkanswer
    	trycheck=0

    	if [ $answerproblem == "True" ]; then

    		for trycheck in 1 2 3 4 5;

    		    do

    		    	checkanswer
    		    	echo "$(date "+%d/%m/%Y %M:%S") - problema no DNS. Try to fix #$trycheck" >> /tmp/logdnscheck.log
    		    	sleep 2
    		    	if [ $answerproblem == "False" ]; then

    		    		trycheck=5

    		    	fi

    		    done;

        fi

        if [ $trycheck -eq 5 ] && [[ $answerproblem == "True" ]]; then

        	echo "$(date "+%d/%m/%Y %M:%S") - problema no DNS. Was not possible to fix. Stopping and exit" >> /tmp/logdnscheck.log
        	stopservices named
        	TEST="False"

        elif [[ $birdstoped == "True" ]]; then

        	#restartservice named
        	echo "$(date "+%d/%m/%Y %M:%S") - DNS working fine. Starting bird service" >> /tmp/logdnscheck.log
        	startservice bird

        fi

        sleep 5

    done



