#!/system/bin/sh

LOG_FILE="/data/local/debugging_log"
for module in /sys/module/*
do
 if [ -e $module/parameters/debug_mask ]; then
echo "0" > $module/parameters/debug_mask
 fi;
done;
echo "03disable-debugging.sh" | tee -a $LOG_FILE
