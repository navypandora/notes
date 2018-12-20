nmcli connection  show: device - network card name
nmcli connection modify enp0s3 ipv6.addresses 2001::1/64
nmcli connection modify enp0s3 ipv6.method static
nmcli connection up enp0s3


to disable ssh ipv6 service, go to /etc/ssh/sshd_config
uncomment ListenAddress 0.0.0.0

IDM
Identity Management server
Redhat IDM - free IPA(Identity Policy Auditing)
IDM server contains: LDAP server, kerberos server, dns server
all the systems should running on same time, we can use use the ntp server

change date: date 1114191818
date 1114191818
    (month,date,hour,minute,year)
firewall-cmd   --add-service=freeipa-ldap (--permanent)
firewall-cmd   --add-service=dns 

