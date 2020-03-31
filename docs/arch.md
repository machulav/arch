# Install Arch on VirtualBox

## Resources
- https://wiki.archlinux.org/index.php/installation_guide
- https://wiki.archlinux.org/index.php/VirtualBox

## 1. Create VM
Download Arch ISO

Create VM with attached ISO

## 2. Partition the disks
```
cfdisk
```

/dev/sda1 - 1G (Linux swap / Solaris)

/dev/sda2 - 15G

## 3. Format the partitions
```
mkswap /dev/sda1
mkfs.ext4 /dev/sda2
```

## 4. Mount the file system
```
swapon /dev/sda1
mount /dev/sda2 /mnt
```

## 5. Select the mirrors
```
vim /etc/pacman.d/mirrorlist
```

Move the geographically closest mirrors to the top of the list

## 6. pacstrap
```
pacstrap /mnt base linux linux-firmware base-devel dhcpcd grub vim
```

## 7. fstab
```
genfstab /mnt >> /mnt/etc/fstab
```

## 8. chroot
```
arch-chroot /mnt
```

## 9. Localization
```
vim /etc/locale.gen
```

Uncomment `en_US.UTF-8 UTF-8` and save the file

```
locale-gen
echo "LANG=en_US.UTF-8"  > /etc/locale.conf
```

## 10. Time zone
```
ln -sf /usr/share/zoneinfo/Europe/Kiev /etc/localtime
hwclock --systohc --utc
```

## 11. Network configuration
```
echo "arch" > /etc/hostname
vim /etc/hosts
```

Add the following content:

```
127.0.0.1	  localhost
::1		      localhost
127.0.1.1	  arch.localdomain	arch
```

Run the command:

```
systemctl enable dhcpcd
```

## 12. Root password
```
passwd
```

## 13. Boot loader
```
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```

## 14. Users
```
useradd -m -G wheel vova
passwd vova
visudo
```

Find the line `# %wheel ALL=(ALL) ALL`, uncomment it and save the file

## 15. Final steps
```
exit
```

Extract ISO from VM

```
reboot
```