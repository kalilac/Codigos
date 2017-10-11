#!/bin/bash

set -x

testfunc(){

	if [ -z "$1" ]; then
	    $1=1000 
	fi;
	
}

testfunc $c c

echo $c
