# Install Arch on VirtualBox

## Resources
- https://wiki.archlinux.org/index.php/installation_guide

## Installation steps
- Download Arch ISO
- Create VM with attached ISO
  - 9GB
- `cfdisk`
  - /dev/sda1 - 1G (Linux swap / Solaris)
  - /dev/sda2 - 8G
- `mkswap /dev/sda1`
- `mkfs.ext4 /dev/sda2`
- `mount /dev/sda2 /mnt`
- `swapon /dev/sda1`
- `vim /etc/pacman.d/mirrorlist`
  - Move the geographically closest mirrors to the top of the list
- `pacstrap /mnt base linux linux-firmware base-devel dhcpcd grub gvim`
- `genfstab /mnt >> /mnt/etc/fstab`
- `arch-chroot /mnt`
- `vim /etc/locale.gen`
  - Uncomment `en_US.UTF-8 UTF-8` and save the file
- `locale-gen`
- `echo "LANG=en_US.UTF-8"  > /etc/locale.conf`
- `ln -sf /usr/share/zoneinfo/Europe/Kiev /etc/localtime`
- `hwclock --systohc --utc`
- `echo "arch" > /etc/hostname`
- `vim /etc/hosts`
  - Add the following content:
    ```
    127.0.0.1	  localhost
    ::1		      localhost
    127.0.1.1	  arch.localdomain	arch
    ```
- `passwd`
- `grub-install /dev/sda`
- `grub-mkconfig -o /boot/grub/grub.cfg`
- `systemctl enable dhcpcd`
- `useradd -m -G wheel vova`
- `passwd vova`
- `visudo`
  - Find this line `# %wheel ALL=(ALL) ALL`, uncomment it and save the file
- `exit`
- Extract ISO from VM
- `reboot`