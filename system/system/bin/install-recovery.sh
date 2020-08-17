#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:12648448:91ba38c8f96f3d32beb9c18b1cd2212f59f5dae0; then
  applypatch  EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:7368704:ea70660dbf3b834d845d52239c8fdb0a76e4c2cc EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 48f8bd50c8f44a05d4719001ce180be47a38de5f 12646400 ea70660dbf3b834d845d52239c8fdb0a76e4c2cc:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=12646400 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
