#!/bin/bash

    expect -c 'spawn ssh -p 22 root@10.103.84.13;
        expect : ;
	send "less91CliCk02!)\n";
	interact'
