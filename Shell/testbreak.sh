#!/bin/bash

set -x

. /tmp/var.txt

t=7

for id in $(cat /tmp/lista_teste); 
    
    do 
    	echo $id; 
    	if [ $t -eq $id ]; then 
    		echo "$t == $id"; 
    		break; 
    	fi;  
    done;

echo "continua de qualquer jeito";


echo $TESTEVAR