#! /bin/bash
#printf "Memory\t\tDisk\t\tCPU\n"
#end=$((SECONDS+2))
KERNEL=$(uname -r)
HOSTNAME=$(cat /etc/hostname)
echo "Memory		Disk	        CPU	        HOSTNAME	        KERNEL" > /opt/scripts/status_server.txt
#while [ $SECONDS -lt $end ]; do
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
echo "$MEMORY$DISK$CPU$HOSTNAME		$KERNEL" >> /opt/scripts/status_server.txt
#sleep 5
#done
