#!/bin/bash
# Declarando Variaveis
LISTA="/opt/scripts/lista_servers.cfg"

for a in `cat ${LISTA}`
  do
  echo -e "\033[1;36m -> \033[0;31m ${a} \033[0m"
  ssh -q ${a} "touch /etc/hostname"
done
echo ""
echo "PASTA HOSTNAME CRIADA NOS SERVIDORES DA LISTA"
echo ""
