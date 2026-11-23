# Boot and live-root design

ZenOS Lite uses the supported Archiso boot chain:
1. Firmware loads Syslinux (BIOS) or GRUB (UEFI).
2. The boot entry passes the ISO volume UUID and the `zenos` install directory.
3. The `mkinitcpio-archiso` initramfs hooks locate and mount the live medium.
4. The Archiso hooks mount the compressed root filesystem and construct the writable overlay.

There is no standalone dracut `/sysroot` mount step in this live-media design. If the system drops to an emergency shell, record the complete message and verify:
- ISO volume label is `ZENOSLITE`.
- Kernel command line contains `archisobasedir=zenos` and `archisosearchuuid`.
- `mkinitcpio` and `mkinitcpio-archiso` are installed in the image.
- The Archiso hooks listed in `/etc/mkinitcpio.conf.d/archiso.conf` are present in the built initramfs.

Do not claim a boot fix until the produced ISO has passed QEMU UEFI and BIOS boot tests.
