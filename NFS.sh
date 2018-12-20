Make directory on Server: mkdir /public
Make entry on /etc/exports: /public    [ip](rw,sync)
service rpcbind start
start nfs: /etc/init.d/nfs start, exportfs -v

NFS client:
mount ip:/public /user
