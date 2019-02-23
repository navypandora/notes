Change block size: hadoop fs -Ddfs.block.size=512 -touchz /zz.txt
Minimum block size: 512 bytes, the block size allocated should be in the multiples of 512

Linux:
Partitions

MB: Megabyte (human form - power of 10)
MiB: Mebibyte (Binary Form - power of 2)
Platter > Track > Sector size = 512 bytes (that's' why Minimum block size is 512 bytes)
Shredding for HDD is done by randomly overwriting the mechanical HDD.
Index Page: maintains the table which file name belongs to which address.
Search Engine Works on inverted index.
OS checks the inode table (and not the HDD) sums all the entries it, to find the free space. | Whenever a file is deleted, the file is not physically deleted, it it just removed from the table.
This is why when a Partition is formatted, it is not really empty | To deleted the old data, the sectors have to be overwritten.
First 2 MiB in the HDD reserved for MBR and Partition table.	
lsblk: to show the Partitions


fdisk /dev/sda: manipulate the Partitions.
mkfs.ext4 /dev/sda3 (make filesystem to ext4 on sda3)


To use a partition, it had to be mounted (also known as linking) as a user can only access files and folders in an OS.


To Mount(link):
mkdir /data;
mount /dev/sda3 /data;

To make it visible: (the os constantly scans for a folder in /media.)
mkdir /media/data;
mount /dev/sda3 /media/data;

To change the visible drive name:
e2label /dev/sda3 name;

Error:(WARNING: Re-reading the partition table failed with error 16: Device or resource busy.
The kernel still uses the old table. The new table will be used at
the next reboot or after you run partprobe(8) or kpartx(8)
Syncing disks.) - Solution: 
partprobe /dev/sda;


To unmount(unlink):
unmount /data

Partition day-2 (16/6)
Only 4 partition can be made, but 59 logical Partitions can be made using the extended partition (recommended - 3 primary and 1 extended)
adding partitions through python - echo -e "n \n e \n" | fdisk /dev/sda

Task1: No. of Partitions that can be made on a hard drive.	
Task2: If file is deleted when formatted?
Task3: What is Format?


How many times can a HDD be overwritten?
Why use export PATH?
difference in fileysystems.?
