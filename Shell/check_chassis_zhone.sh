#!/bin/bash

snmpversion=$1
snmpcommunity=$2
checktype=$3
host=$4
optargs=$5
warntarget=$6
crittarget=$7

if [ -z "$snmpversion" ] || [ -z "$snmpcommunity" ] || [ -z "$checktype" ] || [ -z "$host" ] || [ -z "$optargs" ] || [ -z "$warntarget" ] || [ -z "$crittarget" ]; then

    echo "Favor definir todos os parametros"
    exit 3

else


	if [ $checktype == "temp" ]; then

		current_temp=`snmpwalk -v $snmpversion -c $snmpcommunity $host .1.3.6.1.4.1.5504.3.2.4.1.2.1.3 | awk -F ": " '{print $2}'`

		if [ $current_temp -ge $warntarget ]; then

			service_state="WARNING"
			signal_output="1"

		elif [ $current_temp -ge $crittarget ]; then

			service_state="CRITICAL"
			signal_output="2"

		else
			
			service_state="OK"
            signal_output="0"

		fi

    fi

fi

echo $service_state
echo $signal_output
