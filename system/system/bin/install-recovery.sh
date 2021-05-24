#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:12677120:8aeb75b9a3629ca58172643e1b06386762ea7393; then
  applypatch  EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:7387136:013b1e60071f361640b7070720e3643a5ee3643e EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 4f3c5eed344d4082c9d997ed8d86d6558bada2dd 12675072 013b1e60071f361640b7070720e3643a5ee3643e:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=12675072 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
