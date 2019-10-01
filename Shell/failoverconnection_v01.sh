#!/bin/bash

#set -x

INTERFACEIN=eth1
INTERFACEOUT=eth2
NETWORKPDV=10.101.29.0/24
DFLSERVER=192.168.98.166
ALTSERVER=10.25.0.10

setaultserver(){

	iptables -t nat -A PREROUTING -i $INTERFACEIN -s $NETWORKPDV -d $DFLSERVER -j DNAT --to $ALTSERVER

}

unsetaultserver(){

	iptables -t nat -D PREROUTING -i $INTERFACEIN -s $NETWORKPDV -d $DFLSERVER -j DNAT --to $ALTSERVER

}

while [ 1 ];

    do

    	ping -I $INTERFACEIN $DFLSERVER

    	if [ $? -eq 0 ]; then

    		iptables -t nat -L PREROUTING -n | fgrep $NETWORKPDV

    		if [ $? -eq 0 ]; then

    			unsetaultserver

    		fi
    		
    	else

    		setaultserver

    	fi

    	sleep 5
    done