##### DEFINICOES E ZERANDO VARIAVEIS

dirbase="/var/www/bilheteria/auttar" #Diretorio base do programa
nowliso=$(echo $(date +%y)$(date +%m)$(date +%d)$(date +%H)$(date +%M)) #Data/hora de agora lisa
now=$(echo $(date +%d)"/"$(date +%m)"/"$(date +%y)"-"$(date +%H)":"$(date +%M)":"$(date +%S)) #Data de agora
usuario="auttar_arenadunas" #Usuario de acesso
senha="ObM@v1xAOc6C3ze" #Senha de acesso
servidor="sftp1.auttar.com.br"
#servidor="10.103.0.237"
localbkp="$dirbase/bkparquivos" #Diretorio de backup
localarquivos="$dirbase/arquivos" #Diretorio onde os arquivos serao postados
arquivolog="$dirbase/bkplogs/logEnvioAuttar$nowliso.txt" #Arquivo de logs
numarquivos=$(ls $dirbase/arquivos|wc -l) #Numero de arquivos a transferir


##### INICIO DO PROGRAMA PRINCIPAL

clear
echo "envio de $num arquivos para Auttar" > $arquivolog
echo "Data: $now" >> $arquivolog

echo " " >> $arquivolog

echo " " >> $arquivolog

        cd $localarquivos
        #cd $dirbase
        acesso(){
                expect -c 'spawn sftp '$usuario'@'$servidor';
                        sleep 1; 
                        expect Password: ; send '$senha'\n;
                        sleep 1;
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