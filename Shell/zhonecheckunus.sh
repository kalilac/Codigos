#!/bin/bash

#	set -x 

USER="kalil"
PASS="123mudar."
OUTPUT=NULL

activesonus(){

    slot=1
	card=1

	while [ $slot -le $2 ];

	   do

			while [ $card -le $3 ]; 

			    do

					expect -c 'spawn telnet '""$1""';
					    expect : ;
					    send '""$USER"\n"';
					    expect : ;
					    send '""$PASS"\n"';
					    expect > ;
					    send "olt status '""$slot""'/'""$card""'\n"; 
					    expect > ;
						send "exit\n";
					interact' | grep $slot"/"$card | grep -iv "olt status"

				    card=$(($card + 1))

				done

			slot=$(($slot + 1))
			card=1

		done

}


