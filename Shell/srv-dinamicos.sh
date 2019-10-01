#!/bin/bash

    expect -c 'spawn ssh -p 22 admin@10.104.1.250;
        expect : ;
	send "less91CliCk02!)\n";
	expect : ;
	send "8\n";
	interact'

