#!/usr/bin/env bash
set -euo pipefail

id liveuser >/dev/null 2>&1 || useradd --create-home --groups wheel,audio,video,storage,optical --shell /bin/bash liveuser
passwd --delete liveuser

systemctl enable NetworkManager.service
systemctl enable bluetooth.service
systemctl enable lightdm.service
