#!/system/bin/sh

LOG_FILE="/data/local/ext4_log"
for k in $(busybox mount | grep ext4 | cut -d " " -f3)
do
sync
busybox mount -o remount,noatime,nodiratime $k
done
echo "04ext4_tuning.sh" | tee -a $LOG_FILE
