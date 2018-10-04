#!/bin/bash
# Declarando Variaveis
LISTA="/opt/scripts/lista_servers.cfg"

for a in `cat ${LISTA}`
  do
  echo -e "\033[1;36m -> \033[0;31m ${a} \033[0m"
#  ssh -q ${a} mkdir /opt/scripts
  scp /opt/scripts/health_check_servers/stats.sh ${a}:/opt/scripts/stats.sh
done
echo ""
echo "SCRIPT ADICIONADO AOS SERVIDORES"
echo ""
