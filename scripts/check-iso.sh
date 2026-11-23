#!/usr/bin/env bash
set -euo pipefail
ISO="${1:?Usage: check-iso.sh path/to/image.iso}"
test -f "$ISO"
command -v xorriso >/dev/null
xorriso -indev "$ISO" -report_el_torito plain
xorriso -indev "$ISO" -find / -name 'vmlinuz-linux' -print
xorriso -indev "$ISO" -find / -name 'initramfs-linux.img' -print
