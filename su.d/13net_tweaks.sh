#!/system/bin/sh

LOG_FILE="/data/local/13net_tweaks_log"

busybox sysctl -w net.core.somaxconn=1000 
busybox sysctl -w net.core.netdev_max_backlog=5000 
busybox sysctl -w net.core.rmem_max=16777216 
busybox sysctl -w net.core.wmem_max=16777216 
busybox sysctl -w net.ipv4.tcp_wmem=4096'12582912'16777216 
busybox sysctl -w net.ipv4.tcp_rmem=4096'12582912'16777216 
busybox sysctl -w net.ipv4.tcp_max_syn_backlog=8096 
busybox sysctl -w net.ipv4.tcp_slow_start_after_idle=0 
busybox sysctl -w net.ipv4.tcp_tw_reuse=1
echo "13net_tweaks.sh is executed" | tee -a $LOG_FILE
