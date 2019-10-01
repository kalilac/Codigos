#!/bin/bash

    expect -c 'spawn ssh -p 22 admin@10.103.0.118;
        expect : ;
	send "less91CliCk02!)\n";
	interact'

