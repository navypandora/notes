PAAS
Openshift is an open-source tool which works on platform as a service, we can create a private cloud using Openshift.
Integrate Openshift with GIT, CI/CD-Jenkins
Openshift -(OCP) Open Container Platform

DO180
Docker
Docker images are locally saved in /var/lib/docker 
Docker search ubuntu
Repository is also known as registry
to push to the docker hub; docker push kanishkgodha/openshift:v1
to upload and image to the docker hub, the image name has to be changed; docker tag openshift:v1 kanishkgodha/openshift:v1
then you can push; docker push kanishkgodha/openshift:v1

docker history regstry:latest, tells how the image was made

How to create your own private docker regstry (centralized repo):
registry: (base system at the moment)
docker pull registry
docker run -dit --name myreg registry:latest, the images pushed will be saved in this Container in /var/lib, but if this Container shuts down or gets deleted
the images will be deleted too, to prevent that, we will mount a folder from the base system to the container.

docker run -dit --name myreg -v /repo:/var/lib/registry

registry port no. is 5000, if someone wants to connect to the container from outside, we need port forwarding(PAT:Port Address Translation)
docker run -dit --name myreg -p 5000:5000 -v /repo:/var/lib/registry
hostnamectl set-hostname registry.lw.com

server:(the one who will push the image to the registry)
hostnamectl set-hostname server.lw.com

how to push image to registry: docker tag ubuntu:latest registry.lw.com:5000/ubuntu:latest
by default the images are pulled and pushed by using https protocol, to change that: edit /lib/systemd/system/docker.service (found in systemctl status docker)
EDIT: ExecStart=/usr/bin/dockerd  --inecure-registry "registry.lw.com:5000"
systemctl restart docker
if we ever change the service file: systemctl daemon-reload
docker push registry.lw.com:5000/ubuntu:latest