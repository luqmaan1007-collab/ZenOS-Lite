#!/usr/bin/env bash
set -euo pipefail
ISO="${1:?Usage: check-iso.sh path/to/image.iso}"
test -f "$ISO"
command -v xorriso >/dev/null
command -v bsdtar >/dev/null

REPORT="$(xorriso -indev "$ISO" -report_el_torito plain 2>&1)"
printf '%s\n' "$REPORT"
grep -qi 'BIOS' <<<"$REPORT"
grep -qi 'UEFI' <<<"$REPORT"

FILES="$(bsdtar -tf "$ISO")"
printf '%s\n' "$FILES" | grep -E '/vmlinuz-linux$'
printf '%s\n' "$FILES" | grep -E '/initramfs-linux\.img$'

SIZE="$(stat -c '%s' "$ISO")"
printf 'ISO bytes: %s\n' "$SIZE"
if (( SIZE > 1073741824 )); then
  echo "Warning: ISO exceeds the 1 GiB target; reduce the package profile." >&2
fi
