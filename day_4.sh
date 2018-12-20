14/06
httpd to create a web server
acceses files from /var/www/html

iptables
netstat -tnlp (check the port number)

ps -aux (processes running)
packet capturing
systemctl status/start/stop httpd
tcpdump -i enp0s20u3 -n (packets sent through the network)
tcpdump -i enp0s20u3 -n port 80 (packets only from the port 80)
tcpdump -i enp0s20u3 -n port 80 -X (show the data)
tcpdump -i enp0s20u3 -n port 80 -X -w file.txt (save the data to a file)
tcpdump -r file.txt -X > f.txt (readable format)

shellinabox- to access shell from a browser
giving shellinabox root access:
navigate to /etc/sysconfig/shellinaboxd
comment and uncomment lines
systemctl restart shellinaboxd (for RAM changes)

go to browser - HTTP://[ip address]:port number
getenforce
setenforce 0	
getenforce

adding a user and giving it sudo permissions
navigate to /etc/sudoers
##
## Allow users to run any commands anywhere
root	ALL=(ALL) 	NOPASSWD:(no password required when using root functions)  ALL(power to run any commands anywhere)
