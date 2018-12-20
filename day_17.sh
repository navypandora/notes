SPLUNK: works on Intelligence form


Every server creates a log for everything
logs are stored in raw data.

Splunk's' engineers have already Analysed and pre-sorted all the technolgy's' logs available in the world. Thus, splunk.
Splunk analyses every type of data and parses it. Raw Data and Meta Data after gathering  is stored in splunk hard disk.


Splunk uses its own language Splunk(search)  Processing language for analytics.
We can perform real time Processing in splunk. Just select all real time from options.
Structured data where column name id defined, but splunk can also parse unstructured data. There should be standard log so to make
splunk work on it. You can  create parser for any non standard log. Splunk also has its own cluster, we can connect multiple machines to build
a cluster. In settings there is a option known as "Indexer Clustering"

We have to tell splunk what operation  to perform on the data i.e. what analysis should be done on raw data. 
Splunk is a centralized system which takes data input

it cant replace HDFS because of costly license.

SPARK:
hadoop works on HDD & memory, whereas spark in-memory.
hadoop collects data from HDD and then process it in the RAM then saves the intermediate result on HDD thid process is known as
Disk Processing.
spark too performs batch Processing

hadoop is built on jdk
spark is built on scala, scala runs on jvm, and jvm requires jdk.


TASK: convert hadoop to spark