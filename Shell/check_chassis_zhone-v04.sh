#!/bin/bash

#set -x

snmpversion=$1
snmpcommunity=$2
checktype=$3
host=$4
optargs=$5
warntarget=$6
crittarget=$7
USER="usercheck"
PASS="123mudar."
OUTPUT=NULL
unus=""
fanalarms=""

activesonus(){


	expect -c 'spawn telnet '""$1""';
	    expect : ;
	    send '""$USER"\n"';
	    expect : ;
	    send '""$PASS"\n"';
	    expect > ;
	    send "olt status '""$2""'/'""$3""'\n"; 
	    expect > ;
		send "exit\n";
	interact' | grep $slot"/"$card | grep -iv "olt status"

}

onustotals(){

	totalconfig=$(($(echo -e $unus | sed 's/^ //' | cut -f 1 -d " " | paste -s -d "+" | sed 's/+$//')))
	totalrunnig=$(($(echo -e $unus | sed 's/^ //' | cut -f 2 -d " " | paste -s -d "+" | sed 's/+$//')))
	echo "Total: "$totalconfig "| total="$totalconfig" running="$totalrunnig

}

checkstats(){

    re='^[0-9]+$'

	if [ $1 -ge $2 ]; then

		service_state="WARNING"
		signal_output="1"

	elif [ $1 -ge $3 ]; then

		service_state="CRITICAL"
		signal_output="2"

	elif [ $1 -lt 0 ] || ! [[ $1 =~ $re ]]; then

        service_state="UNKNOWN"
		signal_output="2"

	else

		service_state="OK"
        signal_output="0"

    fi

    echo $service_state "-" $4
    exit $signal_output

}

checkeapsstate(){

	if [ $1 -eq 2 ]; then

		service_state="CRITICAL"
		current_state="link-failed"
		signal_output="2"

	elif [ $1 -eq 4 ]; then

		service_state="CRITICAL"
		current_state="link-down"
		signal_output="2"

	elif [ $1 -eq 0 ]; then

		service_state="IDLE"
		current_state="link-idle"
		signal_output="1"

	elif [ $1 -eq 5 ]; then

		service_state="UNKNOWN"
		current_state="link-preForwarding"
        signal_output="1"

	elif [ $1 -eq 3 ]; then

		service_state="OK"
		current_state="links-up"
        signal_output="0"

    fi

    echo $service_state "-" $4 - $current_state
    exit $signal_output

}

checkfanstatus(){

	expect -c 'spawn telnet '""$1""';
				    expect : ;
				    send '""$USER"\n"';
				    expect : ;
				    send '""$PASS"\n"';
				    expect > ;
				    send "shelfctrl monitor\n";
				    expect > ;
					send "exit\n";
				interact' | grep "Fan alarm" | cut -f 2- -d " "

}

if [ -z "$snmpversion" ] || [ -z "$snmpcommunity" ] || [ -z "$checktype" ] || [ -z "$host" ] || [ -z "$optargs" ] || [ -z "$warntarget" ] || [ -z "$crittarget" ]; then

    echo "Favor definir todos os parametros"
    exit 3

else

	if [ $checktype == "temp" ]; then

		current_temp=`snmpwalk -v $snmpversion -c $snmpcommunity $host .1.3.6.1.4.1.5504.3.2.4.1.2.1.1 | awk -F ": " '{print $2}'`
		
		if [ -z "$current_temp" ]; then

        	current_temp="NOTRESPOND"

        fi

		echo "Temp: "$current_temp"C | Temperature="$current_temp"C Warning="$6"C Critical="$7"C"
		checkstats $current_temp $6 $7 $checktype
		
	elif [ $checktype == "fan" ]; then

		current_fan=`snmpwalk -v $snmpversion -c $snmpcommunity $host .1.3.6.1.4.1.5504.3.2.2.1.4 | awk -F ": " '{print $2}' | cut -f 2 -d "(" | cut -f 1 -d ")"`
		
		if [ -z "$current_fan" ]; then

			current_fan="NOTRESPOND"

		elif [ $current_fan -ne 1 ]; then

			fanalarms=$(checkfanstatus $host $slot $card)

		fi

		checkstats $current_fan $6 $7 "$checktype $fanalarms"

	elif [ $checktype == "cpu" ]; then

		current_cpu=`snmpwalk -v $snmpversion -c $snmpcommunity $host .1.3.6.1.4.1.5504.3.3.3.1.5.1.$5 |  awk -F ": " '{print $2}' | cut -f 2 -d "(" | cut -f 1 -d ")"`
        
        if [ -z "$current_cpu" ]; then

        	current_cpu="NOTRESPOND"

        fi

        echo "cpu: "$current_cpu "| cpu="$current_cpu";"$6";"$7 
        checkstats $current_cpu $6 $7 $checktype

    elif [ $checktype == "memoryuse" ]; then

    	total_memory=`snmpwalk -v $snmpversion -c $snmpcommunity $host .1.3.6.1.4.1.5504.3.3.3.1.3.1.$5 | awk -F ": " '{print $2}' | cut -f 2 -d "(" | cut -f 1 -d ")"`
    	available_memory=`snmpwalk -v $snmpversion -c $snmpcommunity $host .1.3.6.1.4.1.5504.3.3.3.1.2.1.$5 | awk -F ": " '{print $2}' | cut -f 2 -d "(" | cut -f 1 -d ")"`
    	used_memory=$(($total_memory-$available_memory))
    	echo "Memory: used="$used_memory "| used="$used_memory"o size="$total_memory"o"	
    	checkstats $used_memory $available_memory $total_memory $checktype

    elif [ $checktype == "memorystatus" ]; then

    	memorystatus=`snmpwalk -v $snmpversion -c $snmpcommunity $host .1.3.6.1.4.1.5504.3.3.3.1.6.1.$5 | awk -F ": " '{print $2}' | cut -f 2 -d "(" | cut -f 1 -d ")"`
    	 
    	if [ -z "$memorystatus" ]; then

    		memorystatus="NOTRESPOND"

    	fi

    	checkstats $memorystatus $6 $7 $checktype

    elif [ $checktype == "cardstatus" ]; then

    	cardstatus=`snmpwalk -v $snmpversion -c $snmpcommunity $host .1.3.6.1.4.1.5504.3.3.1.1.9.1.$5 | awk -F ": " '{print $2}' | cut -f 2 -d "(" | cut -f 1 -d ")"`
    	
    	if [ -z "$cardstatus" ]; then

    		cardstatus="NOTRESPOND"

    	fi

    	checkstats $cardstatus $6 $7 $checktype

    elif [ $checktype == "eapsstate" ]; then

    	cardstatus=`snmpwalk -v $snmpversion -c $snmpcommunity $host .1.3.6.1.4.1.5504.4.7.13.3.1.2 | awk -F ": " '{print $2}' | cut -f 2 -d "(" | cut -f 1 -d ")"`	
    	checkeapsstate $cardstatus $6 $7 $checktype

    elif [ $checktype == "eapssecundary" ]; then

        cardstatus=`snmpwalk -v $snmpversion -c $snmpcommunity $host .1.3.6.1.4.1.5504.4.7.13.6.1.10 | awk -F ": " '{print $2}' | cut -f 2 -d "(" | cut -f 1 -d ")"`
    	checkeapsstate $cardstatus $6 $7 $checktype

    elif [ $checktype == "onu" ]; then

    	if [ $5 == "COUNT" ]; then

			slot=1
			card=1
			total=0

			while [ $slot -le $6 ];

			   do

				    while [ $card -le $7 ]; 

					    do

		                    unus="$unus $(activesonus $host $slot $card | awk '{ print $8" "$9 }')\n"
		                    card=$(($card + 1))

		                done

		            slot=$(($slot + 1))
					card=1

				done

			onustotals

		elif [ $5 == "SLOT" ]; then

			unus="$(activesonus $host $6 $7 | awk '{ print $8" "$9 }')\n"
			onustotals

		fi
    
    fi

fi
