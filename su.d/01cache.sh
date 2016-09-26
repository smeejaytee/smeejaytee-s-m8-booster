#!/system/bin/sh

sysctl -w vm.overcommit_ratio=75;
sysctl -w vm.vfs_cache_pressure=70;
sysctl -w vm.drop_caches=3;