Data Warehouse

ETL was used earlier  | ELT is used now.

Hadoop is Serial not parallel

Distributed Computing using Hadoop

Distributed Computing's' architecture is the same as Distributed Storage.

Client provides the program to the master  | the master then splits the program and gives it to the slaves.
The slaves run the program and give the output to the master.

ssh 192,68.1.2 export DISPLAY=:0 ; firefox   


TO set the replication factor, which is controlled by the client:
navigate to /etc/hadoop/hdfs-site.xml from client

<property>
<name>dfs.replication</name>
<value>4</value>(how many replicas to be made)
</property>


To set the block size, which is controlled by the client:
navigate to /etc/hadoop/hdfs-site.xml from client

<property>
<name>dfs.block.size</name>
<value>128M</value>(convert and write in bytes)
</property>

Change block size: hadoop fs -Ddfs.block.size=512 -touchz /zz.txt
Minimum block size: 512 bytes, the block size allocated should be in the multiples of 512

Hadoop 1 does not support fall over support, i.e. if the master hardware fails then the whole cluster will get affected.
Hadoop 2&3 can create 2 masters so that if one master fails, the other one becomes the master.

Task1: how to replicate the master in hadoop 1.
Task2: Minimum & Maximum block size.
Task3: parallel operation in hadoop.
Task4: why are there 2 types of arrays.

We can create, upload, delete files in  hadoop but not edit.
You can edit data though, by going to slave;s folder (/data) and editing the file from there.

Python Data Types:
Number: int, float
string: characters '' "", strings can be accessed using [], 
arrays: tuple () read-only, list [] editable


connect to internet on the CLI - nmtui, dhcp client