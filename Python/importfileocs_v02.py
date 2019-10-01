#!/usr/bin/env python3

usuario = "<USERID>"
setor = "<WORKGROUP>"
tipo = "<KEYVALUE>"
marca ="<MMANUFACTURER>"
serie = "<SERIALNUMBER>"
patrimonio = "<ASSETTAG>"
os = "<OSNAME>"
fileocs = open("/tmp/srv-ocsagentsnmp-2019-06-17-10-35-07.ocs")
filedeivce = open("/tmp/tv.cvs")

for line01 in filedeivce:

	for line02 in fileocs:

		beginmark = line02.find('>') + 1
		endmark = line02.find('</')

		if usuario in line02:

			print(line02[0:beginmark] + line01.split(',')[0] + line02[endmark:])

		elif setor in line02:

			print(line02[0:beginmark] + line01.split(',')[1] + line02[endmark:])

		elif tipo in line02:

			print(line02[0:beginmark] + line01.split(',')[5] + line02[endmark:])

		elif marca in line02:

			print(line02[0:beginmark] + line01.split(',')[6] + line02[endmark:])

		elif serie in line02:

			print(line02[0:beginmark] + line01.split(',')[7] + line02[endmark:])			

		elif patrimonio in line02:

			print(line02[0:beginmark] + line01.split(',')[8] + line02[endmark:])			

		elif os in line02:

			print(line02[0:beginmark] + line01.split(',')[9] + line02[endmark:])

		else:

			print(line02[0:beginmark] + "None" + line02[endmark:])




fileocs.close()
filedeivce.close()