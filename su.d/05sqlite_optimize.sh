#!/system/bin/sh

counter="/data/local/counter"

if [ -z $counter ]; then
echo 0 > $counter
fi

count=$(cat $counter)

if [ $count -eq "3" ]; then
vacc="1"
echo "0" > $counter
else
vacc="0"
echo "$(( $count + 1 ))" > $counter
fi

if [ "$vacc" -eq "1" ]; then

for db in $(find /data -iname "*.db")
do
sqlite3 $db 'VACUUM;'
done

fi