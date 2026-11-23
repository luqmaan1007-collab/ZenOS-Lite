#!/usr/bin/env bash
set -euo pipefail
ISO="${1:?Usage: check-iso.sh path/to/image.iso}"
test -f "$ISO"
command -v xorriso >/dev/null
REPORT="$(xorriso -indev "$ISO" -report_el_torito plain 2>&1)"
printf '%s\n' "$REPORT"
grep -q 'BIOS' <<<"$REPORT"
grep -q 'UEFI' <<<"$REPORT"
BOOT_FILES="$(xorriso -indev "$ISO" -ls /arch/boot/x86_64 2>&1)"
printf '%s\n' "$BOOT_FILES"
grep -q 'vmlinuz-linux' <<<"$BOOT_FILES"
grep -q 'initramfs-linux.img' <<<"$BOOT_FILES"
SIZE="$(stat -c '%s' "$ISO")"
printf 'ISO bytes: %s\n' "$SIZE"
