#!/bin/bash

#set -x

SNMPWALK="snmpwalk -n -mALL -v 2c -c "

if [ $1 == "volts" ]; then

	volts=$($SNMPWALK $2 $3 .1.3.6.1.4.1.10520.2.1.5.1.4.0 | cut -f 4 -d " ")
	service_state="OK"   
    signal_output="0"

	if [ $4 == "normal" ]; then

	    echo $volts

	elif [ $4 == "float" ]; then

		testnumber=$(echo $volts | tr "-" " " | sed 's/^ //')

		if [ $testnumber -le 48000 ]; then

			service_state="WARNING"   
            signal_output="1"

            if [ $testnumber -le 44000 ]; then

            	service_state="CRITICAL"
		        signal_output="2"

		    fi
		fi

		echo "Volts: "${volts:0:3}"."${volts:3:2}" | Volts="${volts:0:3}"."${volts:3:2}"V Warning=-48.00V Critical=-44.00V"

	fi

elif [ $1 == "amper" ]; then

	amper=$($SNMPWALK $2 $3 .1.3.6.1.4.1.10520.2.1.5.1.5.0 | cut -f 4 -d " ")

	if [ $4 == "normal" ]; then

		echo $amper

	elif [ $4 == "float" ]; then

	    echo ${amper:0:1},${amper:1:1}"A"

	fi

	if [ $amper -ne 0 ]; then

		service_state="OK"   
	    signal_output="0"

	else

		service_state="CRITICAL"
		signal_output="2"

	fi

elif [ $1 == "alarm01" ]; then

	alarm01=$($SNMPWALK $2 $3 .1.3.6.1.4.1.10520.2.1.5.1.45.0 | cut -f 3- -d " ")

	if [[ $alarm01 == '""' ]]; then

		service_state="OK"   
        signal_output="0"


    else

    	echo $alarm01

    	service_state="WARNING"
		signal_output="1"

	
	fi

elif [ $1 == "alarm02" ]; then

	alarm02=$($SNMPWALK $2 $3 .1.3.6.1.4.1.10520.2.1.5.1.58.0 | cut -f 3- -d " ")

	if [[ $alarm02 == '""' ]]; then

		service_state="OK"   
        signal_output="0"

    else

    	echo $alarm02
    	
    	service_state="WARNING"
		signal_output="1"

	
	fi

elif [ $1 == "alarm03" ]; then

	alarm03=$($SNMPWALK $2 $3 .1.3.6.1.4.1.10520.2.1.5.1.59.0 | cut -f 3- -d " ")

	if [[ $alarm03 == '""' ]]; then

		service_state="OK"   
        signal_output="0"


    else

    	echo $alarm03
    	
    	service_state="WARNING"
		signal_output="1"
	
	fi

elif [ $1 == "batstats" ]; then

	alarm03=$($SNMPWALK $2 $3 .1.3.6.1.4.1.10520.2.1.5.1.11.0 | cut -f 3- -d " ")

	if [[ $alarm03 == 'STRING: "FLOAT"' ]]; then

		service_state="OK"   
        signal_output="0"


    else

    	echo $alarm03
    	
    	service_state="WARNING"
		signal_output="1"
	
	fi

elif [ $1 == "batusetime" ]; then

	alarm03=$($SNMPWALK $2 $3 .1.3.6.1.4.1.10520.2.1.5.1.13.0 | cut -f 3- -d " ")

	if [[ $alarm03 == '""' ]]; then

		service_state="OK"   
        signal_output="0"


    else

    	echo $alarm03
    	
    	service_state="WARNING"
		signal_output="1"
	
	fi

elif [ $1 == "batcharge" ]; then

	alarm03=$($SNMPWALK $2 $3 .1.3.6.1.4.1.10520.2.1.5.1.29.0 | cut -f 3- -d " ")

	if [[ $alarm03 == 'STRING: "HIGH CURRENT"' ]]; then

		service_state="OK"   
        signal_output="0"


    else

    	echo $alarm03
    	
    	service_state="WARNING"
		signal_output="1"
	
	fi

elif [ $1 == "rect" ]; then

	recalarm=$($SNMPWALK $2 $3 $4 | cut -f 3- -d " ")

	if [[ $recalarm == 'STRING: "ON"' ]]; then

		service_state="OK"   
        signal_output="0"

    else

    	echo $recalarm

    	service_state="CRITICAL"
		signal_output="2"

	fi

fi

echo $service_state
exit $signal_output