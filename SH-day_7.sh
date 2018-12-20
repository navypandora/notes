ldd will show us the shared libraries used by the command. If any command doesn't', we can check the libary that is missing or corrupt and then reinstall the lbrary.
strace, use this command before any command to show what is going on in the background when the command is executed

rpm -V setup (shows the change in files of this software)
rpm --setperm setup (reset permissions of setup software    )

cd /var/lib/rpm
/usr/lib/rpm/rpmdb_verify Packages 

rpm --rebuilddb (recreate database)

find /my -perms 644 (find file in /my with permissions 644)
find /my -perms -4000 (find file with suid 4)
find -perms: 6000: exact perms
            -6000: only search for 6 and neglect 0
            /6000: or
