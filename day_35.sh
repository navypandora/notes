python: block/functions

def lw():
	print("hi")

lw('')


def lw(x,y):
	z = x + y
	print(z)

lw(5,6)

Block STAAS:

yum install scsi-target-utils
edit /etc/tgt/tgtd.conf
	<target mycloud>
	backing-store /dev/sdd1
	</target>
systemctl restart tgtd
tgt-admin -show

Client Sends 2 requests:
1. Discover
2. Login

On Client:
iscsiadm --mode d iscoverydb --type sendtargets --portal 192.168.0.108 --discover