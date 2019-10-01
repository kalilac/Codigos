#!/usr/bin/env python
import os

acesspassword = "P?bTXP%_^F58Jj9D"
commandrsync = '/usr/bin/rsync -avzhe "ssh -p 2221"  arenaweb@arenadunas1.dedi.gblix.network:/webdir/arenaweb /webdir'

os.system("cp /webdir/arenaweb/.ssh/known_hosts /tmp")
os.popen(commandrsync, 'w').write(acesspassword)
os.system("cp -f /tmp/known_hosts /webdir/arenaweb/.ssh/known_hosts")