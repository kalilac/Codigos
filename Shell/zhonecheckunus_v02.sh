#!/bin/bash

#set -x 

USER="kalil"
PASS="123mudar."
OUTPUT=NULL
unus=""

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

	#totalconfig=$(echo -e $unus | sed 's/^ //' | cut -f 1 -d " " | paste -s -d "+" | sed 's/+$//' | bc -l)
	totalconfig=$(echo -e $unus | sed 's/^ //' | cut -f 1 -d " " | paste -s -d "+" | sed 's/+$//')
	totalconfig=$(($totalconfig))
	echo "Total configurado $totalconfig"
	#totalrunnig=$(echo -e $unus | sed 's/^ //' | cut -f 2 -d " " | paste -s -d "+" | sed 's/+$//' | bc -l)
	totalrunnig=$(echo -e $unus | sed 's/^ //' | cut -f 2 -d " " | paste -s -d "+" | sed 's/+$//')
	totalrunnig=$((totalrunnig))
	echo "Total rodando: $totalrunnig"

}

if [ $1 == "COUNT" ]; then

	slot=1
	card=1
	total=0

	while [ $slot -le $3 ];

	   do

		    while [ $card -le $4 ]; 

			    do

                    unus="$unus $(activesonus $2 $slot $card | awk '{ print $8" "$9 }')\n"
                    card=$(($card + 1))

                done

            slot=$(($slot + 1))
			card=1

		done

	onustotals


elif [ $1 == "SLOT" ]; then

	activesonus $2 $3 $4

fi 


