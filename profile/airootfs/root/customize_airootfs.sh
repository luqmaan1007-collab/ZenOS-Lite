#!/usr/bin/env bash
set -euo pipefail

id liveuser >/dev/null 2>&1 || useradd --create-home --groups wheel,audio,video,storage,optical --shell /bin/bash liveuser
passwd --delete liveuser

chmod 0755 /usr/local/bin/zenos-boot-diagnostics
systemctl enable NetworkManager.service
systemctl enable bluetooth.service
systemctl enable lightdm.service
systemctl enable zenos-boot-diagnostics.service
