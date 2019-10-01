#!/bin/bash

#set -x 

FILEXML="/tmp/srv-ocsagentsnmp-2019-06-17-10-35-07.ocs"
IFS='
'

for linefile in $(cat $FILEXML);

    do

        echo $linefile | awk '{ print }' | sed -e 's/>*[[ a-zA-Z ]]*</AA/g'

    done
