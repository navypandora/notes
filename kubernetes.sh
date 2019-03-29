Kubernetes Cluster
Kubernetes Master and Slave
We can also setup a single-node Cluster.

KubeAPI server is the main part of the cluster that answers API calls.

Each node runs a kubelet, which takes its order from the master node to bring up pods. Containers are run as part of a pod.

Kubernetes Master:
Install Docker
Kubernetes repo: cat > /etc/yum.repos.d/Kubernetes.repo
                [kubernetes]
                name=Kubernetes
                baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
                enabled=1
                gpgcheck=1
                repo_gpgcheck=1
                gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
swapoff -a
setenforce 0 
iptables -F

yum install -y kubeadm kubelet kubectl
systemctl enable kubelet
systemctl start  kubelet

cat > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1

sysctl --system

kubeadm init 

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl  apply  --filename https://git.io/weave-kube-1.6


kubectl get nodes

Kubernetes Slave:
Install Docker
Kubernetes repo: cat > /etc/yum.repos.d/Kubernetes.repo
                [kubernetes]
                name=Kubernetes
                baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
                enabled=1
                gpgcheck=1
                repo_gpgcheck=1
                gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
swapoff -a
setenforce 0 

yum install -y kubeadm kubelet kubectl
systemctl enable kubelet
systemctl start  kubelet

cat > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1

sysctl --system
kubeadm join 192.168.122.214:6443 --token qxzv1j.d0p3of6hy86b6tnx --discovery-token-ca-cert-hash sha256:8201e6ab0e41291a63beb81091b915af708cf3e6bee96898564d9a0ed19b8ff9
(add this node to the cluster)







$ kubectl get nodes
At this point, the Nodes will not be ready.

This is because the Container Network Interface has not been deployed.
The Container Network Interface (CNI) defines how the different nodes and their workloads should communicate.
we will be using weave in this case:
kubectl apply -f https://git.io/weave-kube


Weave will now deploy as a series of Pods on the cluster. 
The status of this can be viewed using the command $ kubectl get pod -n kube-system



The run command creates a deployment based on the parameters specified, such as the image or replicas.
This deployment is issued to the Kubernetes master which launches the Pods and containers required.
Kubectl run_ is similar to docker run but at a cluster level.
$ kubectl run http --image=katacoda/docker-http-server:latest --replicas=1
$ kubectl get deployments

Use the following command to expose the container port 80 on the host 8000 binding to the external-ip of the host.
kubectl expose deployment http --external-ip="172.17.0.62" --port=8000 --target-port=80

With kubectl run it's' possible to create the deployment and expose it as a single command.
kubectl run httpexposed --image=katacoda/docker-http-server:latest --replicas=1 --port=80 --hostport=8001
kubectl get svc

The command kubectl scale allows us to adjust the number of Pods running for a particular deployment or replication controller.
kubectl scale --replicas=3 deployment http

deployments can done using yaml files by using:
kubectl create -f deployment.yml
and if any changes are done in the yml files they can deployed usng:
kubectl apply  -f deployment.yml



A Kubernetes service deployment has, at least, two parts. A replication controller and a service.

The replication controller defines how many instances should be running, the Docker Image to use,
and a name to identify the service.
The second part is a service. A Kubernetes service is a named load balancer that proxies traffic to one or more containers.
The proxy works even if the containers are on different nodes.
Services proxy communicate within the cluster and rarely expose ports to an outside interface.


Cluster IP is the default approach when creating a Kubernetes Service.
The service is allocated an internal IP that other components can use to access the pods.s
By having a single IP address it enables the service to be load balanced across multiple Pods.

Target ports allows us to separate the port the service is available on from the port the application is listening on. 
TargetPort is the Port which the application is configured to listen on. 
Port is how the application will be accessed from the outside.

While TargetPort and ClusterIP make it available to inside the cluster,
the NodePort exposes the service on each Node’s IP via the defined static port.
No matter which Node within the cluster is accessed, the service will be reachable based on the port number defined.


Another approach to making a service available outside of the cluster is via External IP addresses.

***running kubernetes on cri-o instead of docker***
kubeadm init --cri-socket=/var/run/crio/crio.sock
$ crictl images
$ crictl ps -a

***PV***

In the case of NFS, one PersistentVolume relates to one NFS directory. 
When a container has finished with the volume, the data can either be Retained for future use or the volume can be
Recycled meaning all the data is deleted. The policy is defined by the persistentVolumeReclaimPolicy option.

