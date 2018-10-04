#!/bin/bash

# Declarando Variáveis

LISTA="/opt/scripts/lista_servers.cfg"

# Criando função

function_title()
# cabeçalho 
{
clear
echo -e "\033[1;36m ================================================================\033[0m"
echo -e "\033[1;36m =\033[0;31m  PROGRAMA PARA VERIFICAR SAÚDE DOS SERVIDORES LINUX - STN   \033[1;36m =\033[0m"
echo -e "\033[1;36m ================================================================\033[0m"
echo ""
}
#cont=0
for a in `cat ${LISTA}`
  do
  function_title
  echo -e "\033[1;36m -> \033[0;31m ${a} \033[0m"
  ssh -q ${a} "bash /opt/scripts/stats.sh"
  sleep 3
#  cont=$(( $cont + 1 ))
  scp ${a}:/opt/scripts/status_server.txt /opt/scripts/health_check_servers/status_server_${a}.txt
done
> status_server_full.txt
cat status_server_10.* >> status_server_full.txt
function_title
