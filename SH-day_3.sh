Syslog:
All the logs created by services are stored in /var/log
rsyslog manages logs aof differents programs, services, applications
When a program creates log, it sends 3 types of information to rsyslog:
Data
category of log (facility)
priority (type)
rsyslog decides the location of the log based on these 3 factors
logger authpriv.info "this is test" 
	   (facility.priority)
logserver default port number: 514

Centralized log server:
enable port of rsyslog:
vim /etc/rsyslog.conf
uncomment tcp rules
netstat -tnlp (we should use ss instead of netstat)

remote server:
vim /etc/rsyslog.conf
authpriv.* 					@@192.168.200.211:514
if i want to send all the system logs to the Centralized log server:
last line: *.*				@@192.168.200.211:514

tailf /var/log/secure