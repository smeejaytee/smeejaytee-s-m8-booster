#!/system/bin/sh
mount -o remount,rw / 2>/dev/null 
mount -o remount,rw / / 2>/dev/null 
mount -o remount,rw rootfs 2>/dev/null 
mount -o remount,rw /system 2>/dev/null 
mount -o remount,rw /system /system 2>/dev/null 
busybox mount -o remount,rw / 2>/dev/null 
busybox mount -o remount,rw / / 2>/dev/null 
busybox mount -o remount,rw rootfs 2>/dev/null 
busybox mount -o remount,rw /system 2>/dev/null 
busybox mount -o remount,rw /system /system 2>/dev/null

if [ -e "/sys/kernel/debug/sched_features" ]; then 
busybox chmod 644 /sys/kernel/debug/sched_features mount -t debugfs none /sys/kernel/debug 
busybox mount -t debugfs none /sys/kernel/debug 
busybox echo "NO_AFFINE_WAKEUPS " > /sys/kernel/debug/sched_features 
busybox echo "ARCH_POWER " >> /sys/kernel/debug/sched_features busybox echo "CACHE_HOT_BUDDY " >> /sys/kernel/debug/sched_features 
busybox echo "NO_DOUBLE_TICK " >> /sys/kernel/debug/sched_features busybox echo "NO_FORCE_SD_OVERLAP " >> /sys/kernel/debug/sched_features 
busybox echo "GENTLE_FAIR_SLEEPERS " >> /sys/kernel/debug/sched_features 
busybox echo "NO_HRTICK " >> /sys/kernel/debug/sched_features busybox echo "LAST_BUDDY " >> /sys/kernel/debug/sched_features 
busybox echo "LB_BIAS " >> /sys/kernel/debug/sched_features busybox echo "NO_LB_MIN " >> /sys/kernel/debug/sched_features busybox echo "NO_NEW_FAIR_SLEEPERS " >> /sys/kernel/debug/sched_features 
busybox echo "NO_NEXT_BUDDY " >> /sys/kernel/debug/sched_features 
busybox echo "NONTASK_POWER " >> /sys/kernel/debug/sched_features 
busybox echo "NO_NORMALIZED_SLEEPERS " >> /sys/kernel/debug/sched_features 
busybox echo "NO_OWNER_SPIN " >> /sys/kernel/debug/sched_features 
busybox echo "RT_RUNTIME_SHARE " >> /sys/kernel/debug/sched_features 
busybox echo "START_DEBIT " >> /sys/kernel/debug/sched_features busybox echo "TTWU_QUEUE " >> /sys/kernel/debug/sched_features 
busybox echo "NO_WAKEUP_OVERLAP " >> /sys/kernel/debug/sched_feature 
busybox echo "WAKEUP_PREEMPTION " >> /sys/kernel/debug/sched_features umount /sys/kernel/debug 
busybox umount /sys/kernel/debug 
fi 
mount -o remount,ro / 2>/dev/null 
mount -o remount,ro / / 2>/dev/null 
mount -o remount,ro rootfs 2>/dev/null 
mount -o remount,ro /system 2>/dev/null 
mount -o remount,ro /system /system 2>/dev/null 
busybox mount -o remount,ro / 2>/dev/null 
busybox mount -o remount,ro / / 2>/dev/null 
busybox mount -o remount,ro rootfs 2>/dev/null 
busybox mount -o remount,ro /system 2>/dev/null 
busybox mount -o remount,ro /system /system 2>/dev/null