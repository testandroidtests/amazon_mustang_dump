#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:9543680:86e57840afed0bcbc40578c5269bad1fef4b7b9c; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:8818688:0bc27652f6eb8f64b7e602f270036cd873e556e5 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 0c8880a851f1b3a1b0a81323ec098edd2ee561df 9541632 0bc27652f6eb8f64b7e602f270036cd873e556e5:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=9541632 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
