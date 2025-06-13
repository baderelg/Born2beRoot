# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    monitoring.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: baelgadi <baelgadi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/06/03 18:23:13 by baelgadi          #+#    #+#              #
#    Updated: 2025/06/04 00:19:29 by baelgadi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

arch_kernel=$(uname -a)
printf "#Architecture: $arch_kernel\n"

cpu_physical=$(lscpu | grep "Socket" | awk '{print $2}')
printf "#CPU physical: $cpu_physical\n"

vcpu=$(nproc)
printf "#vCPU: $vcpu\n"

mem_used_mb=$(free -m | grep Mem | awk '{print $3}')
mem_total_mb=$(free -m | grep Mem | awk '{print $2}')
mem_percentage=$(bc <<< "scale=2; $mem_used_mb * 100 / $mem_total_mb")
printf "#Memory Usage: $mem_used_mb/$mem_total_mb%s ($mem_percentage%%)\n" "MB"

disk_used_val=$(df -h -BG --total | tail -n 1 | awk '{print $3}' | cut -d G -f1)
disk_total_val=$(df -h -BG --total | tail -n 1 | awk '{print $2}' | cut -d G -f1)
disk_percentage_val=$(df -h -BG --total | tail -n 1 | awk '{print $5}' | cut -d % -f1)
printf "#Disk Usage: $disk_used_val/$disk_total_val%s ($disk_percentage_val%%)\n" "Gb"

cpu_load=$(mpstat | awk '/all/ { printf "%.2f", 100 - $13 }')
printf "#CPU load: $cpu_load%%\n"

last_boot=$(who -b | awk '{print $3 " " $4}')
printf "#Last boot: %s\n" "$last_boot"

if lsblk -o TYPE | grep -q "lvm"; then
    lvm_use="yes"
else
    lvm_use="no"
fi
printf "#LVM use: %s\n" "$lvm_use"

tcp_connections=$(ss -t state established | tail -n +2 | wc -l)
printf "#Connections TCP: $tcp_connections ESTABLISHED\n"

user_log_count=$(who | wc -l)
printf "#User log: $user_log_count\n"

ipv4_address=$(ip address | grep enp | grep inet | awk '{print $2}' | cut -d / -f1)
mac_address=$(ip address | grep enp -A 1 | grep ether | awk '{print $2}')
printf "#Network: IP %s (%s)\n" "$ipv4_address" "$mac_address"

sudo_count=$(bc <<< "obase=10; ibase=36; $(cat /var/log/sudo/seq)")
printf "#Sudo: $sudo_count cmd\n"
