#!/usr/bin/env python3

usuario = "<USERID>"
setor = "<WORKGROUP>"
tag = "<KEYNAME>"
tipo = "<KEYVALUE>"
marca ="<MMANUFACTURER>"
serie = "<SERIALNUMBER>"
patrimonio = "<ASSETTAG>"
os = "<OSNAME>"
observacoes = "#1 SMP Tue"
status = "x86_64/00-00-15"
fileocs = open("/tmp/srv-ocsagentsnmp-2019-07-04-09-26-24.ocs")
filedeivce = open("/tmp/tv.csv")
count = 0 
#filetoimport = open("/tmp/test.ocs", "w")

def checkprint(line01, line02):

	beginmark = line02.find('>') + 1
	endmark = line02.find('</')
	checkendmark = line02[0:beginmark], line02[endmark:]

	if str(checkendmark).count('</') > 1:

		filetoimport.write(line02[endmark:])
	
	else:

		filetoimport.write(line02[0:beginmark] + line01 + line02[endmark:])

for line01 in filedeivce:

	count += 1

	filetoimport = open("/tmp/" + str(count) + ".ocs", "w")

	for line02 in fileocs:

		if usuario in line02:

			checkprint(line01.split(',')[0], line02)

		elif setor in line02:

			checkprint(line01.split(',')[1], line02)

		elif tag in line02:

			checkprint('TAG', line02)

		elif tipo in line02:

			checkprint(line01.split(',')[5], line02)

		elif marca in line02:

			checkprint(line01.split(',')[6], line02)

		elif serie in line02:

			checkprint(line01.split(',')[7], line02)

		elif patrimonio in line02:

			checkprint(line01.split(',')[8], line02)

		elif os in line02:

			checkprint(line01.split(',')[9], line02)

		elif observacoes in line02:

			checkprint(line01.split(',')[19], line02)

		elif status in line02:

			checkprint(line01.split(',')[21], line02)

		else:

			checkprint("", line02)

	fileocs.seek(0)

fileocs.close()
filedeivce.close()