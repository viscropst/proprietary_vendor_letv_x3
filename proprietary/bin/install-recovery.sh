#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 12226560 c3cb1db47ddd52d487fa76b20eedf433c564d2e7 8945664 5cf7c3ce111eed60209a7736cc76515ed9dd841d
fi

if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:12226560:c3cb1db47ddd52d487fa76b20eedf433c564d2e7; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:8945664:5cf7c3ce111eed60209a7736cc76515ed9dd841d EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery c3cb1db47ddd52d487fa76b20eedf433c564d2e7 12226560 5cf7c3ce111eed60209a7736cc76515ed9dd841d:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
