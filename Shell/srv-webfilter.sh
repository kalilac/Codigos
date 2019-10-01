#!/bin/bash

    expect -c 'spawn ssh -p 22 admin@10.103.0.253;
        expect : ;
	send "less91CliCk02!)\n";
	expect : ;
	send "8\n";
	interact'

