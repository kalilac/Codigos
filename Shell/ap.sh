#!/bin/bash

    expect -c 'spawn telnet 10.101.4.'''$1''';
        expect : ;
	send "cisco\n";
	expect : ;
	send "Cisco\n";
	expect > ;
	send "enable\n";
	expect : ;
	send "Cisco\n";
	interact'

