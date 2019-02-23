
	Developer with Operations: DevOps

Automating everything, doesn't' matter which OS it is: since every OS has different commands

For automation, languages:
1. Imperative - Python, Ruby, perl
need to tell everything, not intelligent
2. Declarative - Ansible
no need to tell how to do, it's' intelligent.

languages like Ansible: puppet, chef, etc.

Ansible:
To get remote access the controller node, it uses ssh.


controller Node:
Ansible all --list-hosts (shows all the hosts)
Ansible 192.168.1.2 --list-hosts

edit /etc/ansible/hosts: 192.168.1.12	ansible_ssh_user=root	ansible_ssh_pass=redhat
						 192.168.1.2	ansible_ssh_user=root	ansible_ssh_pass=1
ansible all -m package -a  "name=httpd state=installed" (install httpd package in all hosts known by packages)
edit /etc/ansible/ansible.cfg: host-key-checking=0

Code in CLI: Ad-hoc Command
Code in file: program file (playbook in ansible)
