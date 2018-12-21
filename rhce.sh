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
nmcli connection add con-name m ifname myteam0  type team config {"runner": {"name": "activebackup"}}
