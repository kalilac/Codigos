#!/bin/bash

#set -x

TOTAL=0
REPORTFILE="/tmp/reportfileimp.txt"

checkfile(){

	if [ -f $REPORTFILE ]; then

	    rm -rf $REPORTFILE

    else

	    touch $REPORTFILE

    fi

}

checkfile


TOTAL=$(curl http://10.102.2.146/sws/app/information/counters/counters.json | fgrep "GXI_BILLING_SEND_TO_TOTAL_CN" | awk '{ print $2 }' )
echo "::: Sansumg ::: Setor: RH ::: IP: 10.102.2.146 :: Serial: Z5W1BJDC900035P ::: Total: $TOTAL" >> $REPORTFILE

TOTAL=$(curl http://10.102.0.4/web/guest/pt/websys/webArch/websys/status/getUnificationCounter.cgi | sed 's/<tr/ \n/g' | fgrep Total | head -1 | awk '{ print $9 }' | cut -f 1 -d "<" | cut -f 2 -d ">")
echo "::: Ricoh201 ::: Setor: Compras ::: IP: 10.102.0.4 ::: Serial: W3018508982 ::: Total:$TOTAL" >> $REPORTFILE

TOTAL=$(curl http://10.102.0.7/web/guest/pt/websys/webArch/websys/status/getUnificationCounter.cgi | sed 's/<tr/ \n/g' | fgrep Total | head -1 | awk '{ print $9 }' | cut -f 1 -d "<" | cut -f 2 -d ">")
echo "::: Ricoh2000 ::: Setor: Facilities ::: IP: 10.102.0.16 ::: Serial: L7096340280 ::: Total: $TOTAL" >> $REPORTFILE

TOTAL=$(curl http://10.102.0.7/web/guest/pt/websys/webArch/websys/status/getUnificationCounter.cgi | sed 's/<tr/ \n/g' | fgrep Total | head -1 | awk '{ print $9 }' | cut -f 1 -d "<" | cut -f 2 -d ">")
echo "::: Ricoh201 ::: Setor: Financeiro ::: IP: 10.102.0.7 ::: Serial: W3029001683 ::: Total:$TOTAL" >> $REPORTFILE