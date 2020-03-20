# Installation

## Resources
- https://wiki.archlinux.org/index.php/installation_guide
- https://medium.com/@gevorggalstyan/how-to-install-arch-linux-on-virtualbox-93bc83ded692

## Steps
1. `fdisk -l`
1. `fdisk /dev/sda`
   - /dev/sda1 - 512M
   - /dev/sda2 - 1G (Linux swap / Solaris)
   - /dev/sda3 - 7.5G
1. `mkfs.ext2 /dev/sda1`
1. `mkswap /dev/sda2`
1. `mkfs.ext4 /dev/sda3`
1. `mount /dev/sda3 /mnt`
1. `swapon /dev/sda2`
1. `pacstrap /mnt base linux linux-firmware dhcpcd grub sudo gvim`
1. `genfstab /mnt >> /mnt/etc/fstab`
1. `arch-chroot /mnt`
1. `vim /etc/locale.gen`
   - Uncomment `en_US.UTF-8 UTF-8` and save the file
1. `locale-gen`
1. `echo "LANG=en_US.UTF-8"  > /etc/locale.conf`
1. `ln -sf /usr/share/zoneinfo/Europe/Kiev /etc/localtime`
1. `hwclock --systohc --utc`
1. `echo "arch" > /etc/hostname`
1. `passwd`
1. `grub-install /dev/sda`
1. `grub-mkconfig -o /boot/grub/grub.cfg`
1. `systemctl enable dhcpcd`
1. `useradd -m -G wheel vova`
1. `passwd vova`
1. `visudo`
   - Find this line `# %wheel ALL=(ALL) ALL`, uncomment it and save the file
1. `exit`
1. `reboot`