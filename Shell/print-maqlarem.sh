#!/bin/bash

#set -x

/root/printreporter/printreport2.sh

/usr/bin/mutt-s "::: IMPRESSORAS ARENA DUNAS ::: MEDICAO MAQLAREM" -c suporte@arenadunas.com.br leituras@maq-larem.com.br < /tmp/reportfileimp.txt

