minikube can be used run a single-node cluster locally. Minikube runs a single-node Kubernetes cluster inside a VM on your laptop
The cluster can be interacted with using the kubectl CLI. 
to view the nodes in the cluster use: $ kubectl get nodes
to deploy an application: $ kubectl run first-app --docker-image=katacoda/docker-http-server --port=80
to expose an application: $ kubectl expose deployment first-deployment --port=80 --type=NodePort
(Once the container is running it can be exposed via different networking options, depending on requirements. 
One possible solution is NodePort, that provides a dynamic port to a container.)


***CKA***
kubectl calls the Kubernetes API (we can use the API directly too)
Nodecontroller keeps checking if the node is healthy or not every 40 secs.


The architecture:
containers are run in pods
pods are usually managed by deployments
services expose deployments
thrd parties handle load balancing

A pod networking application such as flannel in needed to allow the pods to communicate
Kubernetes makes extensive use of etcd for storing configuration and secrets. It acts as the key/value store for the entire cluster.
								
