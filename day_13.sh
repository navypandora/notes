LINUX
useradd (background process):
whem we make a user, it's' information is stored in 8 different locations:
locations, /etc/passwd, /etc/shadow, /etc/groups, /etc/gshadow, /home/[user directory]
/etc/passwd: username:password[x]:UID:GroupID:name/comments:home_directory:command(command that will run as soon as the user logins)
/etc/passwd: kanishk.godha:x:1000:1000:Kanishk Godha:/home/kanishk.godha:/bin/bash
/sbin/nologin shell
/etc/shadow: username:password
/etc/shadow: shellinabox:!!: (password in not)
root power is in the id (sed -i 's/kanishk.godha:x:1000/kanishk.godha:x:0/'  /etc/passwd) | kanishk.godha now has root powers

passwords in OS is not saved in encrypted form it is saved in hash format | RHEL 6 password are saved in md5 format
3 types of users: Admin(root), General/Linux user   ID: 1000-60000, System/Service user 	  

Task1: Read inode table
Task2: make your own shell (python) 3 line code

groupadd Kanishk 
useradd  -G(secondary group)   Kanishk 	 user1
/etc/group

useradd -s /sbin/nologin sarah
chgrp manager adm





Permissions:
Directory: read(ls) | write(touch, mkdir) | Execute(Cd)
permissions are not valid for root
RWX | RWX | RWX
(owner)(group owner)(others)
chown user /share(Change (owner)
userdel -r user (delete user with its home directory)
special permissions: sticky bit(1), SGID(2), SUID(4)
ACL - Access Control List
setfacl -m u:kanishk.godha:rw /file.txt














crack the root password: 
Stop the system in between while booting.
press e to edit when asked to boot
type this in kernel line linux16......('rd.break enforcing=0')
CTRL + x
write (mount -o remount,rw  /sysroot) on the cmd
write (chroot /sysroot)
write (passwd root)
$ restorecon -vv /etc/shadow










First sector of the hard disk - MBR
Program(446 bytes) Partition table(64 bytes) Checksum(2 bytes)
Grub Bootloader
Kernel Detects Device - loads the Device drivers
to load and mount the folders it goes to /etc/fstab
Kernel enables only that Services which are enabled by the systemctl enable
/etc/rc.local runs whatever command you wrote on this
\\\\\\mkdir /root/Desktop/local
\\\\\\chmod +x /etc/rc.local
\\\\\\after this GUI is provided








Networking:
route -n //shows the gateway
route del 0.0.0.0 remove thr gateway (delete gateway)
route add -net 0.0.0.0 gw 192.168.1.4(my IP)

sysctl -a | grep ip_forward
net.ipv4.ip_forward = 1 (this should be 1 for the routing to be on)
edit /etc/systcl.conf
sysctl -p 

dhclient (DHCP) - assign ip manually or automatically
edit /etc/sysconfig/network-script/enp0s3
change BOOTPROTO="static"
	   IPADDR=192.168.1.12
	   NETMASK=255.255.255.0
	   GATEWAY=192.168.1.1
	   DNS1=4.4.2.2
	   DNS2=8.8.8.8
systemctl restart network
hostnamectl set-hostname server12.com
exec bash

PS. (convert string to md5: openssl md5)	
