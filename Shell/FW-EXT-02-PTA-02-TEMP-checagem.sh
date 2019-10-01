#!/bin/bash

    expect -c 'spawn ssh -p 22 admin@10.104.1.223;
        expect : ;
	send "less91CliCk02!)\n";
	expect > ;
	send "enable\n";
	expect : ;
	send "less91CliCk02!)\n";
        expect # ;
	send "show sla monitor operational-state\n";
	expect # ;
	send "exit\n";
    interact'

