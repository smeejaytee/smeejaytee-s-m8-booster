#!/system/bin/sh

mount -o rw,remount / 2>/dev/null 
mount -o rw,remount / / 2>/dev/null 
mount -o rw,remount rootfs 2>/dev/null 
mount -o rw,remount /system 2>/dev/null 
mount -o rw,remount /system /system 2>/dev/null  
busybox mount -o remount,rw / 2>/dev/null
busybox mount -o remount,rw / / 2>/dev/null
busybox mount -o remount,rw rootfs 2>/dev/null
busybox mount -o remount,rw /system 2>/dev/null
busybox mount -o remount,rw /system /system 2>/dev/null


for S in /sys/block/*
do 
if [ -f \$S/queue/rq_affinity ]; then 
busybox echo "1" > \$S/queue/rq_affinity 
fi	
if [ -f \$S/queue/rotational ]; then		
busybox echo "0" > \$S/queue/rotational	
fi	
if [ -f \$S/queue/iostats ]; then		
busybox echo "0" > \$S/queue/iostats	
fi	
if [ -f \$S/queue/nomerges ]; then		
busybox echo "1" > \$S/queue/nomerges	
fi
done

mount -o rw,remount / 2>/dev/null 
mount -o rw,remount / / 2>/dev/null 
mount -o rw,remount rootfs 2>/dev/null 
mount -o rw,remount /system 2>/dev/null 
mount -o rw,remount /system /system 2>/dev/null  
busybox mount -o remount,ro / 2>/dev/null
busybox mount -o remount,ro / / 2>/dev/null
busybox mount -o remount,ro rootfs 2>/dev/null
busybox mount -o remount,ro /system 2>/dev/null
busybox mount -o remount,ro /system /system 2>/dev/null
