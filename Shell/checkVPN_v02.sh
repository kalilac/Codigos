#!/bin/bash

#set -x 

OIDIP="1.3.6.1.4.1.9.9.171.1.2.3.1.7"
OIDVPNUP="1.3.6.1.4.1.9.9.171.1.2.3.1.35"
IPVPNAUTTAR01="10.104.1.223"
SNMPWALK="snmpwalk -v2c -c ARENADASDUNAS "
IDCONNECTION=null
CONNECTIONUP=null
INTERFACEIN=eth1
INTERFACEOUT=eth2
NETWORKPDV=10.101.29.0/24
DFLSERVER=192.168.98.166
ALTSERVER=10.25.0.10
LOGFILE="/var/log/hasystem"

setaultserver(){

	iptables -t nat -A PREROUTING -i $INTERFACEIN -s $NETWORKPDV -d $DFLSERVER -j DNAT --to $ALTSERVER

}

unsetaultserver(){

	iptables -t nat -D PREROUTING -i $INTERFACEIN -s $NETWORKPDV -d $DFLSERVER -j DNAT --to $ALTSERVER

}

checkconnection(){

	IDCONNECTION=$($SNMPWALK $IPVPNAUTTAR01 $OIDIP | fgrep "201.87.176.14" | cut -f 10 -d "." | cut -f 1 -d "=")
	CONNECTIONUP=$($SNMPWALK $IPVPNAUTTAR01 $OIDVPNUP.$IDCONNECTION | awk '{ print $4 }')

}

while [ 1 ];

    do
    	checkconnection

		if [ $CONNECTIONUP != "1" ] || [ -z $CONNECTIONUP ]; then

			iptables -t nat -L PREROUTING -n | fgrep $NETWORKPDV

	    		if [ $? -ne 0 ]; then

	    			setaultserver
	    			echo "$(date +%b" "%d" "%H:%M:%S) $HOSTNAME hasystem: Sistema usando saida alternativa" >> $LOGFILE

	    		fi

		else

			iptables -t nat -L PREROUTING -n | fgrep $NETWORKPDV

    		if [ $? -eq 0 ]; then

    			unsetaultserver
    			echo "$(date +%b" "%d" "%H:%M:%S) $HOSTNAME hasystem: Sistema retirando saida alternativa" >> $LOGFILE

    		fi

    	fi

    	sleep 5

    done