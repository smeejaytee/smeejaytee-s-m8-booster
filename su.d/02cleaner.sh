#!/system/bin/sh

LOG_FILE="/data/local/cleaner_log"
rm -rf /data/anr/*
rm -rf /data/local/tmp/*
rm -rf /data/bugreports/*
rm -rf /data/system/dropbox/*
rm -rf /data/backup/pending/*.tmp
echo "02cleaner is executed" | tee -a $LOG_FILE
