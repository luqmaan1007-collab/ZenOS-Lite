#!/usr/bin/env bash
set -euo pipefail

id liveuser >/dev/null 2>&1 || useradd --create-home --groups wheel,audio,video,storage,optical --shell /bin/bash liveuser
passwd --delete liveuser
install -d -m 0750 /etc/sudoers.d
printf '%s\n' 'liveuser ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/10-liveuser
chmod 0440 /etc/sudoers.d/10-liveuser

systemctl enable NetworkManager.service
systemctl enable bluetooth.service
systemctl enable lightdm.service
