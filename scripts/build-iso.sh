#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
command -v mkarchiso >/dev/null || { echo "Install archiso on Arch Linux first." >&2; exit 1; }
mkdir -p "$ROOT/out" "$ROOT/work"
mkarchiso -v -w "$ROOT/work" -o "$ROOT/out" "$ROOT/profile"
ISO="$(find "$ROOT/out" -maxdepth 1 -type f -name '*.iso' -print -quit)"
test -n "$ISO"
printf 'Built: %s\n' "$ISO"
du -h "$ISO"
