#!/bin/bash

    expect -c 'spawn ssh -p 22 kalil.solutis@10.101.0.6;
        expect : ;
	send "\n"; 
        expect : ;
	send "kalil@arenadunas\n";
    interact'

