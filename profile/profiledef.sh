#!/usr/bin/env bash
iso_name="zenos-lite"
iso_label="ZENOSLITE"
iso_publisher="ZenOS Project"
iso_application="ZenOS Lite Live Desktop"
iso_version="0.1.0"
install_dir="zenos"
buildmodes=('iso')
bootmodes=('bios.syslinux' 'uefi.grub')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=(-comp xz -Xbcj x86 -b 1M -Xdict-size 100%)
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/sudoers.d/"]="0:0:750"
  ["/etc/sudoers.d/10-liveuser"]="0:0:440"
)
