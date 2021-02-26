#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:12675072:34bfc5bb6894648b457b762dcda4303c3c75fe19; then
  applypatch  EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:7387136:b62f2a656aa2888ec58cfc7fce87de536b40cc4f EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 78b47ff18129b2ac9c67acb80838267acfbf1bd5 12673024 b62f2a656aa2888ec58cfc7fce87de536b40cc4f:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=12673024 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
