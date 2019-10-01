#!/bin/bash

    expect -c 'spawn ssh -p 22 kalil.solutis@10.102.10.2;
        expect : ;
	send "\n"; 
        expect : ;
	send "kalil@arenadunas\n";
    interact'

