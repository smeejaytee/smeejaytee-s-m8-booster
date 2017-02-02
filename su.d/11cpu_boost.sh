#!/system/bin/sh

LOG_FILE="/data/local/cpuboostlog_log"
busybox echo "60" > /sys/module/cpu_boost/parameters/boost_ms;
busybox echo "110" > /sys/module/cpu_boost/parameters/input_boost_ms;
busybox echo "1497600" >/sys/module/cpu_boost/parameters/input_boost_freq;
busybox echo "300000" >/sys/module/cpu_boost/parameters/sync_threshold;
echo "11cpu_boost.sh is executed" | tee -a $LOG_FILE