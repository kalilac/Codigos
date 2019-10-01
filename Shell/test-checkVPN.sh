#!/bin/bash




    expect -c 'spawn ssh -p 22 '''$1'''@'''$2''';
        expect : ;
		send "less91CliCk02!)\n";
		expect > ;
		send "enable\n";
		expect : ;
		send "less91CliCk02!)\n";
	    expect # ;
		send "show crypto ikev1 sa\n";
		expect # ;
		send "exit\n";
    interact' | fgrep "Type    : $3"




