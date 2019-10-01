#!/bin/bash

#set -x

MOUNT="lvchange -a y"
UMOUNT="lvchange -a n" 
QINFO="qemu-img info"
CONVERT="qemu-img convert -p"
FORMAT="-O raw"
STR="/dev/0d1c6179-a434-4577-85dc-d5744df1902b"
SOURCE=null
DESTINATION=null

mount(){

	$MOUNT $STR/$SOURCE

}

umount(){

	$UMOUNT $STR/$SOURCE
}

info(){

	$QINFO $STR/$SOURCE | fgrep "disk size"
	$QINFO $STR/$SOURCE | fgrep "backing file"

}

for SOURCE in $(cat /tmp/disco);
    
    do

    	echo "Informacoes do disco: $SOURCE"
    	mount
    	info
    	umount

    done;
