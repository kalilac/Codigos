#!/bin/bash

#Posicao 01 eh tipo
#Posicao 02 eh o identificador da ONU
#POsicao 03 eh o endereço da placa
#Posicao 04 eh opção: adicionar ou deletar
#Posicao 05 eh o IP do equipamento

#set -x 

adddelonuzhone(){

	bridgeposition="1-$(echo $2 | tr "/" "-")"
	
	if [ $3 == "add" ]; then


	    expect -c 'spawn telnet '""$4""';
	       expect : ;
		       send "kalil\n";
		       expect : ;
		       send "123mudar.\n";
		       expect > ;
		       send "onu set '""$2""' vendorid ZNTS serno fsan '""$1""' meprof zhone-2426\n";
		       expect > ;
		       send "bridge add '""$bridgeposition""'/gpononu gem 7'""${2:4:7}""' gtp 700 downlink-voice vlan 298 tagged ipktrule 7\n";
		       expect > ;
		       send "bridge add '""$bridgeposition""'/gpononu gem 9'""${2:4:7}""' gtp 900 downlink vlan 299 tagged video 0/10 rg-brouted eth '\\[1\\-4\\]' ipktrule 9\n";
		       expect > ;
		       send "bridge add '""$bridgeposition""'/gpononu gem 3'""${2:4:7}""' gtp 50099200 downlink vlan 301 tagged rg-brouted eth '\\[1\\-4\\]' ipktrule 5 epktrule 50099200 secure\n";
		       expect > ;
		       send "bridge add '""$bridgeposition""'/gpononu gem 3'""${2:4:7}""' gtp 50099200 downlink vlan 301 tagged rg-brouted wlan 1 ipktrule 5 epktrule 50099200 secure\n";
		       expect > ;
		       send "cpe-mgr add local '""${bridgeposition:0:5}""'-5'""${bridgeposition:6:7}""'/gponport gtp 500 compact none\n";
		       expect > ;
		       send "cpe rg wan modify '""$2""' vlan 301 ip-com-profile Internet\n";
		       expect > ;
		       send "cpe rg wan modify '""$2""' vlan 299 ip-com-profile IPTVWan\n";
		       expect > ;
		       send "cpe rg wan modify '""$2""' vlan 298 ip-com-profile VOICE\n";
		       expect > ;
		       send "cpe rg lan modify '""$2""' eth 1 vlan 299 ip-com-profile IPTVLan\n";
		       expect > ;
		       send "cpe system add '""$2""' sys-common-profile IPTVFw\n";
		       expect > ;
		       send "cpe voip add '""$2""'/1 admin-state up display-name 08432021760 dial-number 558432021760 username 558432021760 password 19417708552108609060 voip-server-profile VSC1 voip-server-profile VSC1\n"
		       expect > ;
		       send "onu resync '""$bridgeposition""'\n";
		       expect > ;
		       send "exit\n";
		    interact'

	elif [ $3 == "del" ]; then

		expect -c 'spawn telnet '""$4""';
	       expect : ;
	           send "kalil\n";
		       expect : ;
		       send "123mudar.\n";
		       expect > ;
		       send "onu delete '""$2""'\n";
		       expect : ;
		       send "yes\n";
		       expect : ;
		       send "no\n";
		       expect : ;
		       send "yes\n";
		       expect > ;
		       send "exit\n";
		    interact'
    fi;

}

adddelonuiphotonics(){

	bridgeposition="1-$(echo $2 | tr "/" "-")"
	
	if [ $3 == "add" ]; then

	    expect -c 'spawn telnet '""$4""';
	       expect : ;
		       send "kalil\n";
		       expect : ;
		       send "123mudar.\n";
		       expect > ;
		       send "onu set '""$2""' vendorid ZNTS serno fsan '""$1""' meprof IPHO_7281G_R genprof IPHO_7281G_R\n";
		       expect > ;
		       send "gpononu profile create spec '""$2""' IPHO_7281G_R IPHO_7281G_R\n";
		       expect > ;
		       send "bridge add '""$bridgeposition""'/gpononu gem 7'""${2:4:7}""' gtp 700 downlink-voice vlan 298 tagged ipktrule 7\n";
		       expect > ;
		       send "bridge add '""$bridgeposition""'/gpononu gem 9'""${2:4:7}""' gtp 900 downlink-video vlan 299 tagged video 0/10 ipktrule 9\n";
		       expect > ;
		       send "bridge add '""$bridgeposition""'/gpononu gem 5'""${2:4:7}""' gtp 50099200 downlink vlan 301 tagged secure ipktrule 5 epktrule 50099200\n";
		       expect > ;
		       send "cpe-mgr add local '""${bridgeposition:0:5}""'-13'""${bridgeposition:4:6}""'/gponport gtp 1300 compact none\n";
		       expect > ;
		       send "onu resync "'""$bridgeposition""'\n";
		       expect > ;
		       send "exit\n";
		    interact'

	elif [ $3 == "del" ]; then

		expect -c 'spawn telnet '""$4""';
	       expect : ;
	           send "kalil\n";
		       expect : ;
		       send "123mudar.\n";
		       expect > ;
		       send "onu delete '""$2""'\n";
		       expect : ;
		       send "yes\n";
		       expect : ;
		       send "no\n";
		       expect : ;
		       send "yes\n";
		       expect > ;
		       send "exit\n";
		    interact'
    fi;

}

adddelonucalix(){

	if [ $3 == "add" ]; then

		if [ $5 == "813" ]; then

			profilemodem="813G-L3"

		elif [ $5 == "716" ]; then

		    profilemodem="716GE-1-L3"

		elif [ $5 == "844" ]; then

			profilemodem="844G-L3"

		fi;
		
	fi; 

		expect -c 'spawn ssh kalil@'""$4""';
		    expect : ;
	           send "123mudar.\n";
		       expect >;
		       send "create ont 59 profile '""$profilemodem""' serial-number '""$2""' admin-state enabled\n";
		       expect >;
		       send "set ont-port 59'""$2""'/G1 rg-mgmt-profile Rg-Mgmt-Prof-1\n";
		       expect >;
		       send "set ont-port 59'""$2""'/G1 mgmt-mode external instance rg-1\n";
		       expect >;
		       send "add eth-svc Data1 to-ont-port 59'""$2""'/G1 bw-profile 50099200 svc-tag-action TA-V-301-L3 admin-state enabled\n";
		       expect >;
		       send "add eth-svc Data2 to-ont-port 59'""$2""'/G1 bw-profile IPTV svc-tag-action TA-V-299 mcast-profile IPTV-MCast-Prof-1 admin-state enabled\n";
		       expect >;
		       send "set ont 59'""$2""' ip-host sip svc-tag-action TA-V-298\n";
		       expect >;
		       send "add sip-svc to-ont-port 59'""$2""'/p1 sip-gw-profile VSC1 user 558420309624 password 41075490878302015607 uri 558420309624 dial-plan Dial-Plan-1 call-waiting disabled caller-id enabled three-way-calling enabled t38-fax-relay enabled admin-state enabled\n";
		       expect >;
		       send "add sip-svc to-ont-port 59'""$2""'"/p2 sip-gw-profile VSC1 user 558420309624 password 41075490878302015607 uri 558420309624 dial-plan Dial-Plan-1 call-waiting disabled caller-id enabled three-way-calling enabled t38-fax-relay enabled admin-state enabled\n";
		       expect >;
			   send "exit\n";
		    interact'

}

zhonechecklostonu(){

	expect -c 'spawn telnet '""$2""';
	    expect : ;
           send "kalil\n";
	       expect : ;
	       send "123mudar.\n";
	       expect > ;
	       send "onu show '""$1""'\n";
	       expect > ;
		   send "exit\n";
	    interact'

}

calixchecklostonu(){

	expect -c 'spawn ssh kalil@'""$2""';
	    expect : ;
	       send "123mudar.\n";
	       expect > ;
	       send "show ont discovered on-gpon-port '""$1""'\n";
	       expect > ;
		   send "exit\n";
	    interact'
}

calixcheckenableonu(){

	expect -c 'spawn ssh kalil@'""$2""';
	    expect : ;
	       send "123mudar.\n";
	       expect > ;
	       send "show ont on-gpon-port '""$1""'\n";
	       expect > ;
		   send "exit\n";
	    interact'
}

zhonecheckall(){

	expect -c 'spawn telnet '""$2""';
	    expect : ;
           send "kalil\n";
	       expect : ;
	       send "123mudar.\n";
	       expect > ;
	       send "onu showall '""$1""'\n";
	       expect ] ;
	       send "yes\n";
	       expect t;
	       send "A\n";
	       expect ;
		   send "exit\n";
	    interact'

}

zhoneporwerport(){

	expect -c 'spawn telnet '""$2""';
	    expect : ;
           send "kalil\n";
	       expect : ;
	       send "123mudar.\n";
	       expect > ;
	       send "gpononu power show '""$1""'\n";
	       expect > ;
		   send "exit\n";
	    interact' 

}

zhoneonustatus(){

	expect -c 'spawn telnet '""$2""';
	    expect : ;
           send "kalil\n";
	       expect : ;
	       send "123mudar.\n";
	       expect > ;
	       send "onu status '""$1""'\n";
	       expect > ;
		   send "exit\n";
	    interact' 

}

zhoneonuimageshow(){

	expect -c 'spawn telnet '""$2""';
	    expect : ;
           send "kalil\n";
	       expect : ;
	       send "123mudar.\n";
	       expect > ;
	       send "onu image show '""$1""'\n";
	       expect > ;
		   send "exit\n";
	    interact' 

}

zhonecheckbridge(){

	bridgeposition="1-$(echo $1 | tr "/" "-")"

	expect -c 'spawn telnet '""$2""';
	    expect : ;
           send "kalil\n";
	       expect : ;
	       send "123mudar.\n";
	       expect > ;
	       send "bridge show '""$bridgeposition""'\n";
	       expect > ;
		   send "exit\n";
	    interact' 

}

zhonecheckcpeport(){

	if [  $3 == "ipho" ]; then

		bridgeposition="1-$(echo $1 | tr "/" "-")"
		bridgeposition=${bridgeposition:0:5}-13${bridgeposition:6:7}

	elif [ $3 == "zhone" ]; then

	    bridgeposition="1-$(echo $1 | tr "/" "-")"
		bridgeposition=${bridgeposition:0:5}-5${bridgeposition:6:7}
	
	fi;

	expect -c 'spawn telnet '""$2""';
	    expect : ;
           send "kalil\n";
	       expect : ;
	       send "123mudar.\n";
	       expect > ;
	       send "cpe-mgr show local '""$bridgeposition""'/gponport\n";
	       expect > ;
		   send "exit\n";
	    interact' 

}

if [ $1 == "zhoneaddremipho" ]; then

	adddelonuiphotonics $2 $3 $4 $5

elif [ $1 == "zhoneaddremzhon" ]; then

	adddelonuzhone $2 $3 $4 $5

elif [ $1 == "calixaddrem" ]; then

	adddelonucalix $2 $3 $4 $5

elif [ $1 == "zhonechecklost" ]; then

	zhonechecklostonu $2 $3

elif [ $1 == "zhonecheckall" ]; then

	zhonecheckall $2 $3

elif [ $1 == "zhonepower" ]; then

	zhoneporwerport $2 $3

elif [ $1 == "zhonestatus" ]; then

	zhoneonustatus $2 $3

elif [ $1 == "zhoneimageshow" ]; then

	zhoneonuimageshow $2 $3

elif [ $1 == "zhonebridgeshow" ]; then

	zhonecheckbridge $2 $3

elif [ $1 == "zhonecpeport" ]; then

	zhonecheckcpeport $2 $3 $4

elif [ $1 == "calixchecklost" ]; then

	calixchecklostonu $2 $3

elif [ $1 == "calixcheckenabled" ]; then

	calixcheckenableonu $2 $3

fi;
