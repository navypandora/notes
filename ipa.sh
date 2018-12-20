Working of an Identity Management server

When a user logs in, 2 things are required: /etc/passwd  /etc/shadow   home directory
directory server is also usually called LDAP server, it stores the attributes of a user, such as: userid, shell, home_dir address
and we store the password in a different server known as Authentication server/Kerberos Server.
SSO can't'  be achieved without Kerberos server.
NFS server is used to provide storage for each user.
When a user logs in, it's' folder in nfs server will be automatically mounted to it's' home directory using the autofs protocols. (autofs will be running on all client systems)
The server and the client have to keep the time synced to connect. (manually, or using ntp server).To prevent Time Replay Attack, we keep every server and client synced with time.
A DNS server also has to be configured, so the servers can contact each other using hostnames.
Public key comes in a certificate. so a certificate system has to be configured


realm name= Kerberos database name
kadmin.local; can be used to connect tbe server to the local Kerberos server