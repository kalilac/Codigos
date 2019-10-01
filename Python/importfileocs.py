#!/usr/bin/env python3

fileocs = open("/tmp/srv-ocsagentsnmp-2019-06-17-10-35-07.ocs")

for line in fileocs:

	beginmark = line.find('>') + 1
	endmark = line.find('</')
	abc = line[0:beginmark], line[endmark:]

	if str(abc).count('</') > 1:

		print(line[0:beginmark], line[endmark:0])

	else:

		print(line[0:beginmark], line[endmark:])

	

fileocs.close()