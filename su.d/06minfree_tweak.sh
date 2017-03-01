#!/system/bin/sh

LOG_FILE="/data/local/06minfree_tweak.sh_log"
( while [ "$(getprop sys.boot_completed)" != 1 ]; do
sleep 20
done
# Shown in mb
lev1=40
lev2=60
lev3=88
lev4=92
lev5=106
lev6=164

# Convert to pages
lmk1=$((lev1/4*1024));
lmk2=$((lev2/4*1024));
lmk3=$((lev3/4*1024));
lmk4=$((lev4/4*1024));
lmk5=$((lev5/4*1024));
lmk6=$((lev6/4*1024));

chmod 644 /sys/module/lowmemorykiller/parameters/minfree;
echo "$lmk1,$lmk2,$lmk3,$lmk4,$lmk5,$lmk6" > /sys/module/lowmemorykiller/parameters/minfree;

) &


echo "06minfree_tweak.sh has run successfully" | tee -a $LOG_FILE

exit 0
