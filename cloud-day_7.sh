VPC: NAAS (Network As A Service)
Rules to connect to a device:
physically connected
ipv4
if same, switch or router
entry in routing table
Router is the gateway between 2 different networks
if the IP is not in the routing table, we can't' send packets to it.
adding IP to routing table to send packets: route add -net 8.8.8.0  netmask 255.255.255.0 gw 192.168.1.1(modem)
nslook www.google.com
IAAS on aws: EC2 + VPC