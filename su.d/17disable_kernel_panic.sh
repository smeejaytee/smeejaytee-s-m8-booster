#!/system/bin/sh

busybox sysctl -w vm.panic_on_oom=0
busybox sysctl -w kernel.panic_on_oops=0 
busybox sysctl -w kernel.panic=0
