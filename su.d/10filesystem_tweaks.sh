#!/system/bin/sh
LOG_FILE="/data/local/filesystem_log"
busybox sysctl -w fs.lease-break-time=10
busybox sysctl -w fs.file-max=524288
busybox sysctl -w fs.inotify.max_queued_events=32000
busybox sysctl -w fs.inotify.max_user_instances=256
busybox sysctl -w fs.inotify.max_user_watches=10240
echo "10filesystem_tweaks.sh is executed" | tee -a $LOG_FILE
