#!/system/bin/sh

LOG_FILE="/data/local/kernel_log"
busybox sysctl -w kernel.random.read_wakeup_threshold=128
busybox sysctl -w kernel.random.write_wakeup_threshold=256
busybox sysctl -w kernel.threads-max=524288
busybox sysctl -w kernel.random.read_wakeup_threshold=128
busybox sysctl -w kernel.random.write_wakeup_threshold=256
busybox sysctl -w kernel.sched_child_runs_first=0
busybox sysctl -w kernel.threads-max=524288
echo "09kernel_twesks.sh is executed" | tee -a $LOG_FILE
