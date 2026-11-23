# Boot and live-root design

ZenOS Lite uses the current Archiso initramfs hook chain. It is based on the official Archiso releng profile:
- `mkinitcpio` and `mkinitcpio-archiso` are mandatory image packages.
- `archiso` and `archiso_loop_mnt` locate the medium and mount the compressed live root.
- `archisobasedir=zenos` and `archisosearchuuid=%ARCHISO_UUID%` identify the live medium.
- BIOS boots with Syslinux; UEFI boots with GRUB.

This is an Archiso live environment, not a dracut installer. Do not manually mount `/sysroot` from its emergency shell. If the live root does not appear, collect the complete boot log and check the ISO UUID, boot parameters, initramfs hook list and embedded initramfs contents.

The workflow inspects the ISO boot catalog and required kernel/initramfs files. A successful build still needs QEMU BIOS + UEFI boot tests and hardware validation before it can be called fixed.
