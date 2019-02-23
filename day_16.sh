HADOOP - Hive
No need for Map Reduce Programming with Hive.
Hive is a interface between hadoop and the user which let's' us input commands int MySQL and convert it into Map Reducing Program.

hadoop fs -cat = select * from TABLE

To install a tar file, export it's' Home and it's' path

Hive Query Language Prompt
Hive isn't' a database, it's' just an interface for managing the hadoop bigdata.


Hive data is stored in /user/hive/warehouse in hadoop

MySQL
CREATE DATABASE
USE [database]
CREATE TABLE mystudent (id int, name string, remarks string)
select * from student;
insert into student (id, name, remarks) values (203, 'kanishk', 'top')
show student (to view the metadata)

load data local inpath '/etc/passwd'





Hadoop is built for batch processing.
Spark works in-memory, for fast processing or real-time processing.

Task : Make hadoop in-memory