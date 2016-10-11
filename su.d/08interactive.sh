#!/system/bin/sh
LOG_FILE="/data/local/interactive_log"

# Set Scaling Governor

( while [ "$(getprop sys.boot_completed)" != 1 ]; do
sleep 20
done
GOVERNOR="interactive"

echo $GOVERNOR > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo $GOVERNOR > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo $GOVERNOR > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo $GOVERNOR > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor

#######Interactive Governor Settings######

echo "20000 1400000:40000 1700000:20000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay

echo "90" > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load

echo "1497600" > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq

echo "1" > /sys/devices/system/cpu/cpufreq/interactive/io_is_busy

echo "40000" > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time

echo "85 1500000:90 1800000:70" > /sys/devices/system/cpu/cpufreq/interactive/target_loads

echo "30000" > /sys/devices/system/cpu/cpufreq/interactive/timer_rate

echo "80000" > /sys/devices/system/cpu/cpufreq/interactive/timer_slack
) &
echo "08interactive.sh has run successfully" | tee -a $LOG_FILE
exit 0