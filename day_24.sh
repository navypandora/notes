Docker
Working on cgi with Docker

mkdir /mydocker
edit /mydocker/Dockerfile
FROM centos:latest
RUN yum install httpd -y
RUN echo hello > /var/www/html/index.html
CMD /usr/sbin/httpd  -DFOREGROUND




docker build /mydocker/  -t myownweb:v1 (will build an image with the name myownweb:v1 and run the script /mydocker/Dockerfile)


Companies always need a OS with pre-installed utilities or apps, the above command will be useful for that




Running Graphical Applications on Docker
Every GUI is a program called as X11
Docker host - the machine which runs the docker engine.

Share the base system's' graphics with the docker container.
Share the graphical socket of the base system with the docker container.
docker run -it --name day24_2  -v   /tmp/.X11-unix/:/tmp/.X11-unix gui (start new container with using /tmp/.X11-unix/X0 of the base system)
export DISPLAY=:0
dbus-uuidgen > /etc/machine-id 

docker commit day24_2 firefox:1
docker run -it --name firefox -e QT_X11_NO_MITSHM=1 (or) --ipc=host  -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY firefox:1 firefox (run container of image with Everything configured and export DISPLAY with -e)	
docker run -it --name jupyter -e QT_X11_NO_MITSHM=1  -v  /tmp/.X11-unix/:/tmp/.X11-unix -e DISPLAY=$DISPLAY  jupyter:firefox jupyter-notebook --allow-root --ip=0.0.0.0 (run jupyter-notebook via docker)
