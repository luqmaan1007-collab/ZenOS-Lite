#!/usr/bin/env bash
set -euo pipefail

id liveuser >/dev/null 2>&1 || useradd --create-home --groups wheel,audio,video,storage,optical --shell /bin/bash liveuser
printf '%s\n' 'liveuser:zenos' | chpasswd

install -d -m 0755 /etc/systemd/system/getty@tty1.service.d
install -d -m 0755 /home/liveuser/Desktop
install -m 0644 /etc/skel/.bash_profile /home/liveuser/.bash_profile
install -m 0755 /etc/skel/.xinitrc /home/liveuser/.xinitrc
install -m 0644 /etc/skel/Desktop/Install-ZenOS.desktop /home/liveuser/Desktop/Install-ZenOS.desktop
chmod 0755 /usr/local/bin/zenos-installer /usr/local/bin/zenos-boot-diagnostics
chown -R liveuser:liveuser /home/liveuser

systemctl mask lightdm.service
systemctl enable getty@tty1.service
systemctl enable NetworkManager.service
systemctl enable bluetooth.service
systemctl enable zenos-boot-diagnostics.service
chmod 0755 /usr/local/bin/zenos-boot-diagnostics
