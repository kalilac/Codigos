#!/bin/bash

#set -x 

MESSAGEBUDY="/webdir/arenaweb/scripts/text"
IPMONITOR="177.75.68.78"
TOEMAIL="suporte@arenadunas.com.br"
SENDMAIL="/usr/sbin/sendmail"

sendlinkfall(){

	$SENDMAIL $TOEMAIL < $MESSAGEBUDY/messagefall
	$SENDMAIL pablogulias@hotmail.com < $MESSAGEBUDY/messagefall
	$SENDMAIL kaio.lesson@gmail.com < $MESSAGEBUDY/messagefall
	$SENDMAIL kalilac@gmail.com < $MESSAGEBUDY/messagefall

}

sendlinkback(){

	$SENDMAIL $TOEMAIL < $MESSAGEBUDY/messageback
	$SENDMAIL pablogulias@hotmail.com < $MESSAGEBUDY/messageback
	$SENDMAIL kaio.lesson@gmail.com < $MESSAGEBUDY/messageback
	$SENDMAIL kalilac@gmail.com < $MESSAGEBUDY/messageback

}

ping -c 4 $IPMONITOR 

if [ $? -eq 1 ]; then

    sendlinkfall
    echo "1" > $MESSAGEBUDY/linkfall

else

	if [ -f $MESSAGEBUDY/linkfall ]; then

		sendlinkback
		rm -rf $MESSAGEBUDY/linkfall

	fi

fi




