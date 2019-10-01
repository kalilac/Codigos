#!/bin/bash

    xhost local:root
    expect -c 'spawn sudo QT_X11_NO_MITSHM=1 /home/kalil.carvalho/Downloads/unetbootin-linux64-661.bin;
        expect : ;
	send "senha@2019\n";
	interact'

