#!/system/bin/sh

LOG_FILE="/data/local/dimmer_log"
echo "2" >/sys/backlight_dimmer/backlight_dimmer;

echo "08backlight_dimmer.sh is executed" | tee -a $LOG_FILE
