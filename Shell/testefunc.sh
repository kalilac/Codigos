#!/bin/bash

set -x

testfunc(){

	if [ -z "$1" ]; then
	    $1=1000 
	fi;
	
}

#testfunc $c c

for name in $(cat /tmp/teste.txt);
    do

    	c="$name $c"
    	c1=($c)

    done

searchfactor=4

idquery=$((1 + RANDOM % $searchfactor))


echo ${c1[$idquery]}
