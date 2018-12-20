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

yum install -y kubeadm kubelet kubectl
systemctl enable kubelet
systemctl start  kubelet

cat > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1

sysctl --system

kubeadm init --pod-network-cidr=10.244.0.0/16 (to initialize the cluster using flannel network)

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml

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
