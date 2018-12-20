NFS : Netowrk File System(read only by default)
NAS - Network Attached Storage
mkdir /rdata/sarah
useradd -d 	/rdata/sarah 	sarah
edit /etc/exports
type: /rdata/sarah		192.168.0.102(rw,no_root_squash(to give root power))
chmod o+w /rdata
systemctl restart nfs
iptables -F
exportfs -v

autofs

*On remote machine
mount  clientIP:/rdata		/rhome/sarah
iptables -F
Security Enhance Linux 
boolean on/off
setsebool -a
setsebool -P use_nfs_home_dirs=1	
setsebool -a (check)
systemctl restart nfs

Make the home directory of the username
-----------Network attached Storage-----------

share the folder and mount the folder



Directory Server: Lightweight Directory Access Protocol






LDAP
yum install authconfig-gtk		nss-pam-ldapd
authconfig-gtk
LDAP
Authentication Method: select LDAP password
LDAP server: ldap://instructor.example.com
LDAP search base DN: dc=example,dc=com
Certificate URL: ftp://example.com/EXAMPLE-CA-CERT




autofs 
yum install autofs
edit /etc/auto.misc: type: ldapuser1  nfsvers=3	 instructor.example.com:/home/guests/ldapuser1
edit /etc/master.misc: type: /home/guests/ 	/etc/auto.misc