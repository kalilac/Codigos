#!/bin/bash

    expect -c 'spawn ssh -p 2221 arenaweb@arenadunas1.dedi.gblix.network;
        expect : ;
	send "d%0fCi3@8224!9x35YO2DfQeN\n";
	interact'

