when you ping a system, a packet is generated  and sent to a system (request)
the system B sends a reply to the system A. 
The whole cycle is called ROUND TRIP TIME.
The message inside each packet is echo "request" or echo "reply"

e2label /dev/sda2 songs (change label of mounted drive in media)

nmap -sP 192.168.1.1-100 
nmap -sT 192.168.1.1-100 (Scan what TCP ports are open)


nmcli connection show (list the network profiles)
nmcli connection add con-name linuxworld ifname enp0s3 type ethernet (add a new profile, name: linuxworld, interface: enp0s3, type: ethernet)
nmcli connection up linuxworld
nmcli connection add con-name linux2 ifname wlp6s0 type wifi ssid linux ip4 192.168.1.27/8 ipv4.method static gw4 192.168.1.1 (name: linux2, ssid: linux, ip: 192.168.1.27, netmask: 255.255.255.0, gateway: 192.168.1.1)

Creating a virtual copy of a network card: ifconfig enp0s3:1 192.168.1.2/8

Vitual network Card:
A single IP can only be assigned to only one network card
Link Aggregation protocol is implemented using teamd

round robin:
nmcli connection add con-name m ifname myteam0  type team 
nmcli connection add con-name slave1 ifname enp0s3 type team-slave master myteam0
nmcli connection up slave1
nmcli connection add con-name slave2 ifname enp0s8 type team-slave master myteam0
nmcli connection up slave2

active-backup:
nmcli connection add con-name m ifname myteam0  type team config '{"runner": {"name": "activebackup"}}'




mariaDB:
install mariaDB
start mariaDB
mysql_secure_installation
mysqldump -u root -p lw > mybackup.sql (create a backup of lw database and store it in mybackup.sql)
mysql -u root -p lw < mybackup.sql (restore database from mybackup.sql)

mysql -u root -p
create user 'vimal'@'192.168.1.%' identified by 'redhat'; (create user vimal, who can login from IP ranging from 192.168.0-255 with password:redhat)

mysql -h 192.168.1.2 -u vimal -p (connect to mysql server at IP 192.168.1.2 with vimal user)


semanage port -a -p tcp -t http_port_t 1234

yum install mod_ssl
https by default runs on port 443

cd /etc/pki/tls/certs
openssl genrsa 2048 > server.key
make server.crt (same name as private key)


<virtualhost [192.168.0.166:1111]>
DocumentRoot  /var/www/lw
rewriteengine on
rewriterule http://www.lw.com   https://www.lw.com

    <directory “/srv/www”>
    order allow,deny
    allow from 192.168.1.12
    </directory>
</virtualhost>

<virtualhost 192.168.1.12:80>
servername app.lw.com
WSGIScriptAlias  /app   /var/www/py/webapp.wsgi
</virtualhost>

chcon -R --reference /var/www/html /srv/www

yum install mod_wsgi



nfs
station1
mkdir /public
yum install nfs-utils
systemctl start nfs
systemctl status nfs
systemctl enable nfs
vim /etc/exports:
    /public   IP/255.255.240.0
systemctl restart nfs
showmount -e (system IP)
exportfs -v

station 2:
mkdir /mnt/nfsmount
showmount -e (server IP)
systemctl restart nfs
systemctl enable nfs
mount [server IP]:/public  /mnt/nfsmount
vim /etc/fstab:
    [server IP]:/public  /mnt/nfsmount    nfs           defaults,_netdev   0 0
mount -a

kerberos
station1
mkdir /protected
wget file.keytab
cp file.keytab /etc/
vim /etc/exports:
     /protected   IP/255.255.240.0(rw, sec=krb5p)
systemctl restart nfs
showmount -e (system IP)
exportfs -v

station2:
cp file.keytab /etc/






install postfix
vim /etc/postfix/main.cf

relayhost=instructor.example.com
inet_interfaces=loopback-only
mynetwork=127.0.0.1/8
mydestination=
myorigin=example.com



iscsi:
server
create lvm
targetcli
create backstore dev=    name= 
create iqn
create luns /backstore/block/vol
create portal 0.0.0.0 3260
create acl 2nd question

restart enable

client:
iscsi-initiator install, start
discover
vim /etc/iscsi/initiatorname.iscsi:
    system1 IQN number
login
df -hT
fdisk
mkfs
mount




