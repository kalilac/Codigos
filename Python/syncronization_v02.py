#!/usr/bin/env python
from getpass import getpass
from subprocess import Popen, PIPE

acesspassword = "P?bTXP%_^F58Jj9D"
proc = Popen(['/usr/bin/rsync', '-avzhe', '"ssh -p 2221"  arenaweb@arenadunas1.dedi.gblix.network:/webdir/arenaweb', '/webdir'], stdin=PIPE)
proc.stdin.write(b'P?bTXP%_^F58Jj9D')
proc.stdin.flush()

#proc.communicate(acesspassword.encode())