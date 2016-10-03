#!/system/bin/sh

mount -o rw,remount /system
LOG_FILE="/data/local/cache_log"
busybox sysctl -w vm.overcommit_ratio=75;
busybox sysctl -w vm.vfs_cache_pressure=70;
busybox sysctl -w vm.drop_caches=3;
busybox sysctl -w vm.dirty_writeback_centisecs=1500;
busybox sysctl -w vm.dirty_expire_centisecs=500;
busybox sysctl -w vm.page-cluster=0;
busybox sysctl -w vm.min_free_kbytes=4096;
( while [ "$(getprop sys.boot_completed)" != 1 ]; do
sleep 20
done
busybox sysctl -w vm.dirty_background_ratio=5; 
busybox sysctl -w vm.dirty_ratio=10;
echo val

) &

echo lalakjd

echo "01cache_vm.sh is executed" | tee -a $LOG_FILE
mount -o ro,remount /system

exit 0
