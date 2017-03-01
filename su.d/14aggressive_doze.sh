#!/system/bin/sh

LOG_FILE="/data/local/14aggressive_doze.sh_log"

dumpsys deviceidle force-idle deep
echo "14agressive_doze.sh is executed" | tee -a $LOG_FILE