Ansible:
ansible-playbook user.yml --extra-vars="u=vimal p=lw" (provide variables for the ones asked)
ansible-vault create/view/edit secret.yml (store password variables in this to encrypt it)
ansible-playbook mail.yml --ask-vault-pass (ask for the vault password to access the vault and  input the password from that)
ansible-playbook mail.yml --vault-password-file=mypasswd (vault psssword is stored in this file)
make groups of IPs in the hosts file by naming them with [name]

How to do exception handling and error handling in Ansible.

- hosts: web
  tasks:
    - package:
        name: httpd
        state: present
      ignore_errors: yes
    - command: "dat1"
      ignore_errors: yes (lets the ansible-playbook continue if this task fails)


- hosts: web
  tasks:
    - stat:
        path: "test.yml"
      register: x

    - debug:
        msg: "{{ x }}" (shows the status of the above commands)
   
   - command: "touch /root/Documents/mycode/ansible/mail.yml"
     when: x.stat.exists != true (if exists == false, then only run this command)
