#!/system/bin/sh

for module in /sys/module/*
do
 if [ -e $module/parameters/debug_mask ]; then
echo "0" > $module/parameters/debug_mask
 fi;

done;
