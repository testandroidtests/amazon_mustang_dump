#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:12656640:202b9262da30bb41f16cadf750b2f44e51418394; then
  applypatch  EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:7360512:13d9135b9770ad0ace01b4838c0026b79c9c16da EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 350a3f5749f2e3525ca8dc6481dfab1ffd794e55 12654592 13d9135b9770ad0ace01b4838c0026b79c9c16da:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=12654592 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
