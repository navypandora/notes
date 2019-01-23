ls -z filename; to get the selinux context of the file.
SELinux contexts follow the SELinux user:role:type:level syntax.
The MLS/MCS Range column, is the level used by Multi-Level Security (MLS) and Multi-Category Security (MCS).
An SELinux policy rule states that processes running in the passwd_t domain are allowed to read and write to files labeled with the shadow_t type.
When a user runs the passwd utility, the user's' shell process transitions to the passwd_t domain. 

With SELinux, since the default action is to deny, and a rule exists that allows (among other things) 
applications running in the passwd_t domain to access files labeled with the shadow_t type, 
the passwd application is allowed to access /etc/shadow, and update the user's' password.

http service (or any service) can't' change	 or access files which are labeled as other services(for eg. samba).
The restorecon utility restores the default SELinux context for files.

To prevent incorrectly labeled and unlabeled files from causing problems,
 file systems are automatically relabeled when changing from the disabled state to permissive or enforcing mode.

 chcon -t samba_share_t /var/www/html/testfile
(change file type to sambas)

semanage fcontext -a -t samba_share_t '/web(/.*)?'
(change directory type to samba permanently)
restorecon -v /web
(apply changes to the folder)
semanage fcontext  -d '/web(/.*)?'
(remove the applied context to folder)

enforcing=0
Setting this parameter causes the machine to boot in permissive mode, which is useful when troubleshooting issues.
in permissive mode the system continues to create the labels correctly. s

selinux=0
This parameter causes the kernel to not load any part of the SELinux infrastructure. 

autorelabel=1
This parameter forces the system to relabel similarly to the following commands:
~]# touch /.autorelabel
~]# reboot
If the system labeling contains a large amount of errors, 
you might need to boot in permissive mode in order that the autorelabel succeeds.


SELinux policy rules are not used if DAC rules deny access first.
the restorecon command reads the files in the /etc/selinux/targeted/contexts/files/ directory,
to see which SELinux context files should have.

Files in the /etc/selinux/targeted/contexts/files/ directory define contexts for files and directories.

To mount multiple mounts from a single NFS export, with each mount having a different context,
 use the -o nosharecache,context options. 

When a file is copied over an existing file, the existing file's' context is preserved,
unless the user specified cp options to preserve the context of the original file, such as --preserve=context.

Files and directories keep their current SELinux context when they are moved.

Use the matchpathcon utility to check if files and directories have the correct SELinux context.

Use the tar --selinux command to create archives that retain contexts and to restore files from the archives


***priority***

Prepare a new module with modified file context. Install the module with the semodule -i command and set the priority of the module to 400. We use sandbox.pp in the following example.
~]# semodule -X 400 -i sandbox.pp
~]# semodule --list-modules=full | grep sandbox
400 sandbox           pp
100 sandbox           pp

To return back to the default module, enter the semodule -r command as root:
~]# semodule -X 400 -r sandbox
libsemanage.semanage_direct_remove_key: sandbox module at priority 100 is now active.



***MLS***

to configure MLS(Multi-Level Security)
Install selinux-policy-mls
SELINUX=permissive
SELINUXTYPE=mls

Use the fixfiles script to create the /.autorelabel file containing the -F option to ensure that files are relabeled upon next reboot:
~]# fixfiles -F onboot

Reboot your system. During the next boot, all file systems will be relabeled according to the MLS policy. The label process labels all files with an appropriate SELinux context:
*** Warning -- SELinux mls policy relabel is required.
*** Relabeling could take a very long time, depending on file
*** system size and speed of hard drives.
***********
Each * (asterisk) character on the bottom line represents 1000 files that have been labeled.
 In the above example, eleven * characters represent 11000 files which have been labeled.

~]# useradd -Z staff_u john
~]# semanage login --modify --range s2:c100 john
~]# semanage login -l

***mapping***

To map the Linux newuser user to the SELinux user_u user, enter the following command as root:
~]# semanage login -a -s user_u newuser
The -a option adds a new record, and the -s option specifies the SELinux user to map a Linux user to.
The last argument, newuser, is the Linux user you want mapped to the specified SELinux user.

to change the default mapping from unconfined_u to user_u:
~]# semanage login -m -S targeted -s "user_u" -r s0 __default__

***kiosk***
The xguest package provides a kiosk user account. This account is used to secure machines that people walk up to and use,
such as those at libraries, banks, airports, information kiosks, and coffee shops.
The kiosk user account is very limited: essentially, it only allows a user to log in and use Firefox 
to browse Internet websites. Guest user is assigned to xguest_u.


To prevent Linux users in the guest_t domain from executing applications in their home directories and /tmp:
~]# setsebool -P guest_exec_content off

***sandbox***
The sandbox security utility adds a set of SELinux policies that allow a system administrator
to run an application within a tightly confined SELinux domain. 
~]# sandbox -X appname

Access to the network is also initially impossible inside the sandbox. To allow access, use the sandbox_web_t label. For example, to launch Firefox:
~]$ sandbox ‑X ‑t sandbox_web_t firefox
Warning

The sandbox_net_t label allows unrestricted, bi-directional network access to all network ports.
The sandbox_web_t allows connections to ports required for web browsing only.


***troubleshooting***
To temporarily disable dontaudit rules, allowing all denials to be logged, enter the following command as root:
~]# semodule -DB
The -D option disables dontaudit rules; the -B option rebuilds policy. After running semodule -DB

to make a single domain permissive instead of the whole system
~]# semanage permissive -a httpd_t
~]# semanage permissive -d httpd_t


~]# semodule -d permissivedomains
Once a policy module is disabled through the semodule -d command, it is no longer showed in the output of the semodule -l command. To see all policy modules including disabled, enter the following command as root:
~]# semodule --list-modules=full

The ls -Z command shows file1 labeled with the httpd_sys_content_t type.
SELinux allows httpd to read files labeled with this type, but not write to them, 
even if Linux permissions allow write access.

***filesystems***
Files can be shared between the Apache HTTP Server, FTP, rsync, and Samba, 
if the required files are labeled with the public_content_t or public_content_rw_t type.