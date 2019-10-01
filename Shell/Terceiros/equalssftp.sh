#!/bin/bash
##### DEFINICOES E ZERANDO VARIAVEIS

dirbase="/webdir/arenaweb/sigcatering/shared/equals" #Diretorio base do programa
nowliso=$(echo $(date +%y)$(date +%m)$(date +%d)$(date +%H)$(date +%M)) #Data/hora de agora lisa
now=$(echo $(date +%d)"/"$(date +%m)"/"$(date +%y)"-"$(date +%H)":"$(date +%M)":"$(date +%S)) #Data de agora
usuario="arenadasdunas" #Usuario de acesso
servidor="ftp01.main.sao.equals.com.br"
localbkp="$dirbase/bkparquivos" #Diretorio de backup
localarquivos="$dirbase/arquivos" #Diretorio onde os arquivos serao postados
arquivolog="$dirbase/bkplogs/logEnvioAuttar$nowliso.txt" #Arquivo de logs
numarquivos=$(ls $dirbase/arquivos|wc -l) #Numero de arquivos a transferir

##### INICIO DO PROGRAMA PRINCIPAL

clear
curl http://sigcatering.aquitemingresso.com/conciliacaofinanceira
echo "envio de $num arquivos para Auttar" > $arquivolog
echo "Data: $now" >> $arquivolog

echo " " >> $arquivolog

echo " " >> $arquivolog

        cd $localarquivos
		acesso(){
                expect -c 'spawn sftp -i ~/arenadasdunas.com.br.pem -P 20220 '$usuario'@'$servidor';
                        sleep 1;
                        expect >; send "cd upload/venda-interna-sigcatering/\n" 
                        expect >; send "put *\n";
                        sleep 1;
                        expect >; send "ls -alh\n";
                        sleep 1;
                        expect >; send "bye\n";
                        sleep 1;
                        interact'
                }

                acesso >> $arquivolog
                cd $dirbase


mv $localarquivos/* $localbkp/


