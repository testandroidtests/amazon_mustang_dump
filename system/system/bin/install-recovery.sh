#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:12658688:284aa50104abce386eb3481af052f9b74067c927; then
  applypatch  EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:7370752:41262c88026350b71d98204ea86ad76b72ba207e EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery b89826edf674b4a4ce116f3fe87e7bb78be59ce2 12656640 41262c88026350b71d98204ea86ad76b72ba207e:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=12656640 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
