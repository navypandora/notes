python
symbols like >, <, | can be used only while being on the shell directly
bash(running command using bash) -c "[command]"


cat > h1.txt (single > to overwrite, double >> to append)
>>><property>
>>><name></name>
>>></property>

File Handling
f2 = open('file', 'w')
f2.write('hello')
f2.close( (Saving the file)
while using cgi-bin:
the /var/www/cgi-bin can only be accessed by the root
chown apache /var/www/cgi-bin

scp root/Desktop/File 	192.168.1.7:/root/Desktop(Copying file through the network) (-r to copy a directory)

hadoop breaks the file into multiple parts of fixed size | depends on the block size for eg. 64 MB | client decides the block size.
Replication factor, when breaking the data into parts | it replicates them dependent on the factor, default is 3 | this too is decided by the client.

Client directly sends the files to the slaves | fetches the IP addresses of the slaves from the master

Client doesnt replicate the data | master asks the slaves to create replicas 
hadoop automatically connects to another slave in case one fails | fail over

Does hadoop work on parallel?