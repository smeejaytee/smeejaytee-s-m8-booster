mount -o remount,rw / 2>/dev/null 
mount -o remount,rw / / 2>/dev/null 
mount -o remount,rw rootfs 2>/dev/null mount -o remount,rw /system 2>/dev/null 
mount -o remount,rw /system /system 2>/dev/null 
busybox mount -o remount,rw / 2>/dev/null 
busybox mount -o remount,rw / / 2>/dev/null 
busybox mount -o remount,rw rootfs 2>/dev/null 
busybox mount -o remount,rw /system 2>/dev/null 
busybox mount -o remount,rw /system /system 2>/dev/null 

MMC=/sys/block/mmc* 
for S in \$MMC; 
do 	
if [ -f \$S/queue/nr_requests ]; then 		
busybox echo "1024" > \$S/queue/nr_requests 	
fi 
done 

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
