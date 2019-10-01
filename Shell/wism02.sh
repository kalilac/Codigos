#!/bin/bash

    expect -c 'spawn ssh -p 22 10.101.4.13;
        expect : ;
	send "\n";
        expect : ;
	send "admin\n";
	expect : ;
	send "S0lut1s@2014\n";
	interact'

