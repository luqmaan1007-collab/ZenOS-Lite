#!/usr/bin/env bash
set -euo pipefail

id liveuser >/dev/null 2>&1 || useradd --create-home --groups wheel,audio,video,storage,optical --shell /bin/bash liveuser
printf '%s\n' 'liveuser:zenos' | chpasswd

# The live desktop starts from the tty1 autologin shell, not a display manager.
install -d -m 0755 /etc/systemd/system/getty@tty1.service.d
chmod 0755 /home/liveuser/.xinitrc
chown -R liveuser:liveuser /home/liveuser
systemctl mask lightdm.service
systemctl enable getty@tty1.service
systemctl enable NetworkManager.service
systemctl enable bluetooth.service
systemctl enable zenos-boot-diagnostics.service
chmod 0755 /usr/local/bin/zenos-boot-diagnostics
