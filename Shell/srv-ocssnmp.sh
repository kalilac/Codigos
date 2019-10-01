#!/bin/bash

    expect -c 'spawn ssh -p 22 root@10.101.0.254;
        expect : ;
	send "less91CliCk02!)\n";
	interact'

