#!/system/bin/sh

LOG_FILE="/data/local/sqlite_log"
counter="/data/local/counter"
busybox="/su/xbin/busybox"
sqlite="/system/xbin/sqlite3"

if [ ! -f $LOG_FILE ]; then
  touch $LOG_FILE
  chmod 775 $LOG_FILE
fi

if [ -z $counter ]; then
  echo 0 > $counter
  exit 1
fi

if [ $(cat $counter) = "3" ]; then
  vac="1"
else
  echo "$(($(cat $counter) + 1))" > $counter
  vac="0"
fi

if [ $vac = "1" ]; then
  if [ $sqlite ]; then
      echo "* SQLite Tweaks Starting at $( date +"%m-%d-%Y %H:%M:%S" )" > $LOG_FILE

      echo "SQLite database VACUUM and REINDEX started at $( date +"%m-%d-%Y %H:%M:%S" )" >> $LOG_FILE
      for i in `busybox find /d* -iname "*.db"`; do
          /su/xbin/sqlite3 $i 'VACUUM;'
          resVac=$?
          if [ $resVac == 0 ]; then
              resVac="SUCCESS"
          else
              resVac="ERRCODE-$resVac"
          fi
          /system/xbin/sqlite3 $i 'REINDEX;'
          resIndex=$?
          if [ $resIndex == 0 ]; then
              resIndex="SUCCESS"
          else
              resIndex="ERRCODE-$resIndex"
          fi
          echo "Database $i:  VACUUM=$resVac  REINDEX=$resIndex" >> $LOG_FILE
      done
      echo "SQLite database VACUUM and REINDEX finished at $( date +"%m-%d-%Y %H:%M:%S" )" >> $LOG_FILE
      echo "0" > $counter
      echo "* SQLite Tweaks Finished At $( date +"%m-%d-%Y %H:%M:%S" )" >> $LOG_FILE
  else
    echo "No sqlite3 at xbin"
  fi
else
  echo "It's not a day to vacuum"
fi


TIME=$($busybox date | $busybox awk '{ print $4 }')
$busybox echo "[$TIME] 05sqlite su.d script has ran" >> $LOG_FILE