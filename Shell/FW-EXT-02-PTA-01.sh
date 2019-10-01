#!/bin/bash

    expect -c 'spawn ssh -p 22 kalil.solutis@10.104.1.12;
        expect : ;
	send "kalil@arenadunas\n";
	expect > ;
	send "enable\n";
	expect : ;
	send "kalil@arenadunas\n";
    interact'

