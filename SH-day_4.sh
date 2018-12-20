If we want the logs be sorted according to the systems:
Centralized System:

edit /etc/rsyslog.conf
$template myvimaltemp, "/var/log/wlog/%HOSTNAME%.log"
						 			  (variable)
*.*		?myvimaltemp

systemctl  restart 	rsyslog
man rsyslog.conf


logs for the syscall activity in the system:
it's' logged through glibc

auditctl -l
start monitoring logS by adding rules: (the rules are stored in the RAM, which makes the rules temporary)
auditctl -w /etc/shadow -p r -k mykey
grep "/etc/shadow" /var/log/audit/audit.log
to make the rules permanent:
add the rules in: /etc/audit/audit.rules /etc/audit/rules.d/audit.rules



Difference Between Auditd and rsyslog:
Programs send their log to the log server by themselves (rsyslog)
auditd asks kernel for the logs(auditd)