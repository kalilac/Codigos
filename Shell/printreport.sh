#!/bin/bash

set -x
TOTAL=0
IPIMP=0
LINE=null
REPORTFILE="/tmp/reportfileimp.txt"

ricoh(){

	IPIMP=$(echo $LINE | cut -f 2 -d " ")

	TOTAL=$(curl http://$IPIMP/web/guest/pt/websys/webArch/websys/status/getUnificationCounter.cgi | sed 's/<tr/ \n/g' | fgrep Total | head -1 | awk '{ print $9 }' | cut -f 1 -d "<" | cut -f 2 -d ">")
	echo "::: $(echo $LINE | cut -f 1 -d " ") ::: Setor: Compras ::: IP: $(echo $LINE | cut -f 2 -d " ") ::: Serial: $(echo $LINE | cut -f 3 -d " ") : $TOTAL pÃ¡ginas" >> $REPORTFILE

}

if [ -f $REPORTFILE ]; then

	rm -rf $REPORTFILE

else

	touch $REPORTFILE

fi

for LINE in $(cat address);
    
    do
    	#echo $LINE

    	ricoh
    
    done;

