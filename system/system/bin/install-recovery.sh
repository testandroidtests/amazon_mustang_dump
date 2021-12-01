#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:12675072:a9a502a5e594ae409ec4098d809947b5759cf24d; then
  applypatch  EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:7383040:9b072411c2fb936432c27155b1d4604af92bc197 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery ede31f67bc989745be52d2ca88b4a5a76524fa59 12673024 9b072411c2fb936432c27155b1d4604af92bc197:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=12673024 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
