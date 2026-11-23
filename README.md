# ZenOS Lite

A clean, small Arch Linux live desktop. This is a new project and does not reuse the old ZenOS image.

## Goals
- Keep the compressed live ISO around 1 GB or less where practical; the exact size depends on upstream package versions and firmware.
- BIOS + UEFI x86_64 boot support.
- XFCE desktop, browser, networking, Bluetooth, audio, file manager, terminal, system settings and package manager.
- Standard Archiso initramfs and boot flow. The Archiso initramfs mounts the live medium and prepares the live root; this project does not use a hand-written /sysroot mount command.
- Separate ARM64 image work only after x86_64 is reproducible.

## Build
Run on Arch Linux:
```bash
sudo pacman -S --needed archiso qemu-desktop edk2-ovmf
./scripts/build-iso.sh
```
The ISO is written to `out/`.

GitHub Actions builds the x86_64 ISO and uploads it as an artifact. Build success is not the same as boot validation: use the QEMU test workflow and then test on real hardware.

## Recovery / sysroot
This image uses the official `mkinitcpio-archiso` hooks and Archiso boot parameters. If the live root fails to mount, collect the full boot log and check the ISO label, boot parameters, and initramfs hook list. Do not run `mount /sysroot` manually in the Archiso emergency shell; this is not a generic dracut installer environment.

## Scope
This is a live OS baseline, not yet an installed desktop distribution. An installer, updater, store UI and ARM64 support are separate milestones.
