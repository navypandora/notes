HAdoop 3:
Single Node Cluster: Master and slave on the same machine (for testing)
hdfs dfsadmin -report
Web UI port: 9870
Default Block size: 128MB
Spark supports Machine Learning
Spark works on Python
pyspark: code using sc=sparkcontext
sc.textFile: read files from anywhere.
pyspark lazyevaluates in the background: 
RDD - Resilient Data Set
Lambda function: p = Lambda x,y: x+y
				 p(1,2)

				 fdata = sc.textFile("file:///etc/passwd")
				 finaldata = fdata.filter(lambda x:"bash x")
				 fdata.count('')

Intergrate Spark in hdfs: sc.textFile(hdfs:///etc/passwd).filter(lambda x: "bash" in x).count('')
