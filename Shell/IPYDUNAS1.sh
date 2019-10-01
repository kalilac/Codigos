#!/bin/bash

    expect -c 'spawn ssh -p 22 root@10.103.20.100;
        expect : ;
	send "Vi3wCict@iCliCk02!)\n";
	interact'

