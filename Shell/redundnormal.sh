#!/bin/bash

#set -x 

ORIGINALFILE="dnsmasq.hosts"
REDUNCTFILE="dnsmasq.hosts-reduncancia"
DNSSERVICE="/etc/init.d/dnsmasq "

toredundance(){

	$DNSSERVICE stop
	cp -f $REDUNCTFILE /etc/dnsmasq.hosts
	$DNSSERVICE start

}

tonormal(){

	$DNSSERVICE stop
	cp -f $ORIGINALFILE /etc/dnsmasq.hosts
	$DNSSERVICE start

}

case "$1" in

	"redundancia") toredundance
	;;

	"normal") tonormal
	;;

esac	