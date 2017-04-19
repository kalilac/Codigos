#!/usr/bin/env python
# encoding: utf-8

# >>> managervlan.py  - 01/06/2015
# Por Kalil Carvalho <kalilcarvalho@cinte.com.br>
# Script de inclusao e remocao de VLAN's nos switchs de backbone da CINTE.
# Telnetlib - https://docs.python.org/2/library/telnetlib.html
# Instalação - sudo pip install telnetlib
# Arquivos que podem mudar: ipsswitchs.txt

import getpass
import sys
import telnetlib
import time
import subprocess

def setpassword(*args):

	password = "l@mbd@#"

	if len(args[0][8:].rstrip()) == 1:

		password = "51gm@$0" + args[0][8:].rstrip() + "#210915#"

	elif len(args[0][8:].rstrip()) == 2:
		
		password = "51gm@$" + args[0][8:].rstrip() + "#210915#"		

	elif len(args[0][8:].rstrip()) == 3:

		password = "51gm@$" + args[0][9:11].rstrip() + "#210915#"

	return(password)

def accesswitch(*args):

	def sedreturn():

		for sendreturn in range(10):

				tn.write(b"\n")
	
	HOST = args[0]
	user = "admin@system"
	sleeptime = args[2]
	password = args[1]
	tryagain = 0
	telnetout = "Connection closed by other peer"


	while (tryagain < 5):

		try:

			tn = telnetlib.Telnet(HOST)

			#tn.set_debuglevel(5)
			time.sleep(sleeptime)
			tn.write(user.encode('ascii') + b"\n")
			time.sleep(sleeptime)
			tn.write(password.encode('ascii') + b"\n")
			time.sleep(sleeptime)
			tn.write(b"\n")
			time.sleep(sleeptime)

			for command in args[3]:

				print("Executando comando: %s" % command)

				if "interface" in command:

					tn.write(command.encode('ascii') + b"\n")
					sedreturn()
					
				else:

					tn.write(b"\n")
					tn.write(command.encode('ascii') + b"\n")
					sedreturn()

			time.sleep(sleeptime)
			tn.write("quit".encode('ascii') + b"\n")
			telnetout = tn.read_all()
			tryagain = 5

		except Exception:

			tryagain += 1
			print("Erro na conexao telnet: tentativa %s" % tryagain)
			pass

	tn.close()
	return(telnetout)

def checkversion(*args):

	command = [ "display version", ]

	switchtype = accesswitch(args[0], args[1], 1, command)

	for line in switchtype.splitlines():

		if "3Com Corporation" in line:

			if "4800" in switchtype:

				return("4800")

			else:

				return("3Com")

		elif "H3C Comware" in line:

			return("H3C")

		elif "HP Comware" in line:

			return("HP")

def getcfgfile(*args):

	def createfile(*args):

		subprocess.Popen(["/usr/bin/touch", "/var/lib/tftpboot/" + args[0]],stdout = subprocess.PIPE).communicate()[0]
		subprocess.Popen(["/usr/bin/chmod", "777", "/var/lib/tftpboot/" + args[0]],stdout = subprocess.PIPE).communicate()[0]

	switchmodel = checkversion(args[0], args[1])

	if switchmodel == "H3C" or switchmodel == "3Com":

		createfile(switchmodel)
		command = [ "tftp 10.10.200.97 put unit1>flash:/3comoscfg.cfg " + switchmodel ]
		accesswitch(args[0], args[1], 1, command)

	elif switchmodel == "HP" or switchmodel == "4800":

		createfile(switchmodel)
		command = [ "tftp 10.10.200.97 put 3comoscfg.cfg " + switchmodel ]
		accesswitch(args[0], args[1], 1, command)

	return(switchmodel)

def checkinterface(*args):

	cfgfile = open("/var/lib/tftpboot/" + args[0])
	interfaces = list()
	toaddtrunk = list()
	toaddhybrid = list()
	intertrunk = list()
	interhybrid = list()
	position = 0
	check = 0
	
	for line in cfgfile:

		if "interface" in line.split():

			interfaces.append(line.splitlines())

			for line in cfgfile:

				interfaces[position].append(line.splitlines())

				if "#" in line.split():

					position += 1
					break

	for check in range(position):

		for interindex in interfaces[check]:

			if "Backbone" in str(interindex):

				for porttype in interfaces[check]:

					if "port link-type trunk" in str(porttype):

						toaddtrunk.append(interfaces[check][0])

					elif "port link-type hybrid" in str(porttype):

						toaddhybrid.append(interfaces[check][0])
	
	if args[1] in "rem":

		for line in toaddtrunk:

			intertrunk.append(line)
			intertrunk.append("undo port trunk permit vlan %s" % args[2])

		command = intertrunk
		return(command)

		

	for line in toaddtrunk:

		intertrunk.append(line)
		intertrunk.append("port trunk permit vlan %s" % args[2])

	for line in toaddhybrid:

		interhybrid.append(line)
		interhybrid.append("port hybrid vlan %s tagged" % args[2])

	command = intertrunk
	command += interhybrid
	return(command)

def saveconfiguration():

	if switchmodel is "3Com":

		command.append("save")
		command.append("Y")

	elif switchmodel is "H3C":

		command.append("save")
		command.append("Y")

	elif switchmodel is "HP":

		command.append("save force")

	elif switchmodel is "4800":

		command.append("save force")


	command.append("quit")
	command.append("quit")

def checksalvedconfiguration():

	if "saved configuration successfully" in resultsaveconfiguration:

		print("Configuracoes salvas com sucesso")

	else:

		print("Atencao: configuracoes podem nao ter sido salvas. Favor verificar!")

fileips = open("/usr/local/share/textfiles/ipsswitchs.txt")
switchproblem = ""

for ipsswitch in fileips:

	output = subprocess.Popen(["/usr/bin/ping", "-c 1", "-W 1", ipsswitch],stdout = subprocess.PIPE).communicate()[0]

	if ('1 received' in output):

		password = setpassword(ipsswitch)
		command = [ "system-view", ]

		print("Swtich %s respondendo. Apto a receber as configuracoes." % ipsswitch.rstrip())

		if "add" in sys.argv[1]:

			command.append("vlan "  + sys.argv[2])
			command.append("description " + '"' + sys.argv[3] + '"')
			switchmodel = getcfgfile(ipsswitch, password)
			interfacestochange = checkinterface(switchmodel, sys.argv[1], sys.argv[2])

			for line in interfacestochange:

				command.append(line)

			saveconfiguration()
			resultsaveconfiguration = accesswitch(ipsswitch, password, 1, command)
			checksalvedconfiguration()

		elif "rem" in sys.argv[1]:

			command.append("undo vlan "  + sys.argv[2])
			switchmodel = getcfgfile(ipsswitch, password)
			interfacestochange = checkinterface(switchmodel, sys.argv[1], sys.argv[2])

			for line in interfacestochange:

				command.append(line)

			saveconfiguration()
			resultsaveconfiguration = accesswitch(ipsswitch, password, 1, command)
			checksalvedconfiguration()

	elif ("0 received" in output):

		print("Switch %s inacessivel!" % ipsswitch.rstrip())
		switchproblem += "\n" + ipsswitch

print("Lista dos switchs que não foram possiveis realizar as configuraçẽos: ")

for ips in switchproblem:

	print(ips)

if _name_ == '_main_':

	print("Script de controle de VLAN's finalizado!")