LINUX
I/O Redirection
cat Command: takes the input and prints it on the standard output


tr 'a-z' 'A-Z' (transform a-z to A-Z)
tr 'a-z' 'A-Z' < hi.txt (take input from hi.txt)
> - output Redirection
< - input Redirection

wc -l(lines) -w(words) -c(characters) z.txt
EOL = End of line
EOF = End of File

rpm -qa | wc -l (no. of softwares installed)
command (output)  | command (input)

Task1: remove EOF from files












Combine 2 drives:
format both the drives (format when creating a new partition)
Delete the previous partitions on both drives
pvcreate /dev/sdc1(convert to physical volume)
pvdisplay /dev/sdc1(to check)
pvcreate /dev/sda2
pvdisplay /dev/sda2
vgcreate volumegroup /dev/sdc1 /dev/sda2
(volume group)
vgdisplay volumegroup(to check)
lvcreate --name volumename --size 170G  /dev/volumegroup
mkfs.ext4 /dev/volumegroup/volumename
(format this partition)
mkdir /media/lv0
mount /dev/volumegroup/volumename  /media/lv/
lvextend --size  +1G /dev/volumegroup/volumename
(to extend the size)
not shown in lvdisplay | e2fsck -f /dev/volumegroup/volumename (if unmounted)
resize2fs /dev/volumegroup/volumename (if already mounted)


we have to format it to extend the size. (without erasing the old files)


edit /etc/fstab (to mount permanently)
/dev/new/lvol0 		/media/logical 		ext4 	default(r,w)	0 0
mount -a (to check)











HADOOP

Map Reduce Protocol
To Distribute processes to different processors  is called (map phase), and to get the
output from all the processors is known as (reduce phase).
Mapper: Find the relevant data.

hadoop jar /usr/share/hadoop/hadoop-examples-1.2.1.jar -input /passwd	-mapper "grep bash" -reducer "wc -l" -output /out2
		   (use this program)							(taken input)   ('function' to use)  (reduces data)	  (send the output)


haddop jar /usr/share/hadoop/hadoop-examples-1.2.1.jar -input /passwd   -mapper ./mapper.py  -file mapper.py 	-reducer ./reducer.py  -file reducer.py	-output	/out2

Task2: Monitor system to automatically extend the size of the datanode partition as soon as it goes above 80%