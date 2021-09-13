#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:12679168:a8e9cca68b5a7230383605894ec6977369015534; then
  applypatch  EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:7387136:be5aae854755f59b08a5de87b855bb6632bf07e0 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 3d27fd5062f760415a4edf0df0fd091638c0b5f2 12677120 be5aae854755f59b08a5de87b855bb6632bf07e0:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=12677120 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
