#!/system/bin/sh
LOG_FILE="/data/local/07fstab_log"
mount -o rw,remount -t auto /system

# Create backup if we don't have it
if [ ! -e /etc/fstab.swap~ ]; then
cp /etc/fstab.swap /etc/fstab.swap~
fi

# Empties out fstab.swap if it exists
if [ -e /etc/fstab.swap ]; then
truncate -s 0 /etc/fstab.swap
fi

# Before we add those, let's add the details
echo "#<src>          <mnt_point>  <type>  <mnt_flags>  <fs_mgr_flags>" >> /etc/fstab.swap

# Finally add the zRAM mountpoint
sed -ir "/(\/dev\/block\/zram).*/d" /etc/fstab.swap
echo "/dev/block/zram0 none swap defaults zramsize=655360000,swapprio=200" >> /etc/fstab.swap

# Delete the annoying empty swapr file
if [ -e /etc/fstab.swapr ]; then
# GO AWAY!
rm /etc/fstab.swapr
fi

mount -o ro,remount -t auto /system
echo "07fstab has run successfully" | tee -a $LOG_FILE