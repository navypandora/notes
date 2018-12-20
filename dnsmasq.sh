Create Our own dns server using dnsmasq

Serverside:
install dnsmasq
make entries in /etc/hosts
systemctl restart dnsmasqd

clientside:
iptables -F
vim /etc/reslv.conf
search lw.com
nameserver 192.168.56.106

vim /etc/dnsmasq.conf
address=/lw.com/10.1.2.3 : regexp