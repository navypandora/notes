HADOOP


Hadoop admin uses the Hadoop, mostly company's' worker are the hadoop admin and they are also called hadoop client
Data should be loaded on RAM before it can be used.
If your system has 1GB RAM and file size is 1 TB can you prorcess the file? -- yes  we can prorcess
Fragments of file is loaded on RAM which has to be used but this process will be slow.
If you want to speed up the program you need Distributed Computing.
In Distributed Computing we use Map Reduce (M.R.) 



System that share their resource they are known as TASK TRACKER(TT) and system which gets these resources is known as JOB TRACKER (JT)

To make your system the job tracker:
Navigate to /etc/hadoop/mapred-site.xml
<configuration>
<property>
<name>mapred.job.tracker</name>
<value>YourIP:9002</value>
</property>
</configuration>


Navigate to /etc/haddop/core-site.xml
<property>
<configuration>
<property>
<name>fs.default.name</name>
<value>hdfs://192.168.1.7:9001</value> (master IP with hdfs protocol)
</property>
</configuration>
haddop-daemon.sh start jobtracker



To make your system the tasktracker:
Navigate to /etc/hadoop/mapred-site.xml
<configuration>
<property>
<name>mapred.job.tracker</name>
<value>jobtrackerip:9002</value>
</property>
</configuration>

Navigate to /etc/haddop/core-site.xml
<property>
<configuration>
<property>
<name>fs.default.name</name>
<value>hdfs://192.168.1.7:9001</value> (master IP with hdfs protocol)
</property>
</configuration>


haddop-daemon.sh start tasktracker

service port - 9002
Web UI port - 50030

hadoop jar (to run a program on hadoop) - when using this the cliet will always go to the jobtracker
hadoop jar /usr/share/hadoop/hadoop-examples-1.2.1.jar(run this program)  wordcount(run this function)  /fb.txt(from this file)   /output(output to this file)
 
Task1: make a cluster with 3 tasktrackers



PYTHON
Iterations
for loop
print(i), (no new line)
