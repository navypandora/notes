add commands to /root/.bashrc to make them run as soon as the terminal starts
add IPs to /etc/hosts to give them a shortcut (www.kanishk.com, this is a good syntax)

#FDDN: (Fully Qualified Domain Name) add this to /etc/hosts (good syntax)
hostname hostnamectl kanishk

ssh -o StrictHostKeyChecking=no

echo redhat | passwd 1234   --stdin		(enter password automatically)


Big Data (Problem or Challenge)
Distributed Storage (Solution to Big Data) (Storage through Networking) | Hadoop(Application)
Split a single file into multiple files to transfer to different systems.
Master and slaved computer (cluster)
Master-slave model (Distributed Storage cluster)
Master -> Name Node
Slave -> Data Node
HDFS (Hadoop Distributed File System) protocol - for connections between systems.
Hadoop runs on Java
No Single Point Of Failure
Horizontal Scaling

install Oracle Java
change Java 
export 	JAVA_HOME=/usr/java/jdk1.8.0_171-amd64/
export PATH=/usr/java/jdk1.8.0_171-amd64/bin/:$PATH
add these commands to /root/.bashrc

install Hadoop 1
rpm -ih hadoop-1.2.1-1.x86_64.rpm --force (forcefully because it was conflicting with other files )

to make your machine the master:
naigate to /etc/hadoop/hdfs-site.xml
add these lines:
<property>
<name>dfs.name.dir</name> (making this machine the Name Node)
<value>/hadoop</value> (directory for hadoop)
</property>
mkdir /hadoop (create the directory in the code)


to make your machine the Slave:
naigate to /etc/hadoop/hdfs-site.xml
add these lines:
<property>
<name>dfs.data.dir</name> (making this machine the data node)
<value>/data</value> (directory provided to Master for Storage)
</property>
mkdir /data (create the directory in the code)

to make your machine the client:
install the software


to point whos the master: (master, Slave, client, tasktracker and jobtracker all have to do this)
navigate to /etc/hadoop/core-site.xml
<property>
<name>fs.default.name</name>
<value>hdfs://192.168.1.7:9001</value> (master IP with hdfs protocol)
</property>

format master filesystem:
echo Y | hadoop namenode -format --stdin (when running in python)

iptables -F (close firewall) (only for Slaves)
setenforce 0

start namenode hadoop on master:
hadoop-daemon.sh start namenode

check if its working:
jps (will show namenode or datanode)

to check the storage provided to the master:
hadoop dfsadmin -report

create a filesystem in hadoop:
hadoop fs -mkdir /foldername

use hadoop:
CLI - hadoop fs
Web UI - master IP:50070 (Java port)


client commands:
send a file to hadoop fs:
hadoop fs -put f2.txt /