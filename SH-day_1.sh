LUKS: LinuX Unified Key Storage-on-disk
cryptsetup luksformat /dev/sda1
cryptsetup luksOpen /dev/sda1 lw

mkfs.ext4 /dev/mapper/lw
mkdir /media/usb
mount /dev/mapper/lw /media/usb
umount /dev/mapper/lw

cryptsetup luksClose lw
now, to use the device, the device has to be mounted again and again, to solve that, we'll' add the entry to /etc/fstab
but when we reboot, since the luks is already closed, the entry in fstab file is corrupt, to solve that:
vim /etc/crypttab:
lw  /dev/sda1

now whenever the system reboots, a prompt will appear asking for a password to unlock the encrypted drive
to solve that, we add a key to unlock the drive
cryptsetup luksAddKey /devsdb1 /mykey
chmod 600 /mykey
vim /etc/crypttab:
lw /dev/sda1	/mykey


cryptsetup luksDump /dev/sda1: show luks information
cryptsetup luksHeaderBackup /dev/sdb1 --header-bakcup-file /root/hi.key
cryptsetup luksHeaderRestore /dev/sdb1 --header-bakcup-file /root/hi.key