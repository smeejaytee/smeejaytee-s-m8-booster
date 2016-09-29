#!/system/bin/sh

for k in $(busybox mount | grep ext4 | cut -d " " -f3)
do
sync
busybox mount -o remount,noatime,nodiratime $k
done