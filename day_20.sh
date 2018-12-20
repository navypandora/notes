Container(technology)  Docker(Product of Container)
Loads a new OS in 1 sec(s).
1 OS takes only about 10 MB RAM.


systemctl restart Docker;
docker info;
docker images;
docker images are in tar form
docker load -i centos-latest.tar;
docker run -it --name navypandora centos:latest; (run centos in Interactive shell with Terminal)
docker ps; (to see the OSes running)
exit; (to shutdown the OS)
yum whatprovides ifconfig;
watch free -m; (keeps  updating in                                                                                                                                  a time interval)
Docker start/stop --name; (to restart a docker)
docker attach 	  --name; (to get its console)
docker commit navypandora clone1:v1; (create a clone image of navypandora name it clone1 and version1)
docker run -d(run in background) -it -v(volume)  /run/media/root/RHEL-7.5\ Server.x86_64:/dd date(command) centos:latest (run a docker of centos with the dvd mounted under /dd folder)
docker rm navypandora(remove dockers)
docker rm -f $(docker ps -a -q)


systemctl is not supported by docker.
systemctl doesn't' start a service, it just runs the start/stop script for the service such as /usr/sbin/httpd for systemctl start httpd
To make a service permanent on the docker: /usr/sbin/httpd write it in .bashrc.



BareMetal OS- installing an OS on the base machine.
Virtualbox: installing an OS on the virtual machine.
Container: Installing OS on the docker.
CentOS - Open Source version of RedHat
Redhat takes code from Fedora







Data Science:
Analyzing data is data science.
TO analyze using mathematical formulas or linear expressions - numpy.
Vector/list/1-D_array - [7, 7, 1, 2, 4, 6, 6, 6]
2-D_array/matrix - [[1, a, 23], [2, d, 34]] 

Numpy:
import numpy
numpy.array(x); to convert list into array
x.shape; shows the no. of rows and columns

slicing and dicing: a2[rows,columns]
always convert data into array list when using numpy


Pandas:
panda.read_csv('filename'); read the csv file.








Machine Learning:
making the machine think and predict the way we do.
Prediction using old experiences(data).
Through training, a model is created, then that model is tested on the rest of the values.
Training Phase: training the program
Model: program creates the model.
testing phase: the model is tested with the rest of the values
Datapoint on a dataset.
If the datapoint plotted using the dataset and it forms a straight line, it is known as Linear Regression Model
Since the computer doesn't' understand graphs, we have to Create a formula or a algorithm to make the computer understand in that way.
y = a + mx (single variable) (Simple Regression Machine Learning Model)
The more data we input or the more we train it, the better the formula will be created by the model.
SkLearn: helps in creating the model or the formula. 
Jupyter:
X in capital
y in small
X is always in 2-D array