***SCM***
yum install git -y
git config --global user.name "navypandora"
git config --global user.email "kanishk.godha@live.com"
git clone 

***build-automation***
we will be using gradle
wget https://services.gradle.org/distributions/gradle-4.7-bin.zip
yum install -y unzip java-1.8.0-openjdk
mkdir /opt/gradle
unzip -d /opt/gradle/ ~/gradle-4.7-bin.zip
add this to the pathfatal: cannot do a partial commit during a merge.


mkdir /myproj
cd /myproj
gradle wrapper (this will add graddle files to your project)

./gradelw build (this command will install the required graddle if not installed in your environment)

cd /project
gradle init
vim build.gradle:
	task sayhello << {
        println "Hello, world"
	}
	task anotherTask << {
	        println "new one"
	}

	sayhello.dependsOn anothertask


./gradlew sayhello anotherTask (will perform both tasks from build.gradle file)
./gradlew sayhello (will perform both tasks since sayhello dependsOn anothertask)
 (build depends on zip, zip dependsOn npm_build, npm_build dependsOn npm_test, npm_test dependsOn npmInstall)

***Continous-Integration***
We will be using jenkins for this
sudo yum -y remove java
sudo yum -y install java-1.8.0-openjdk
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum -y install jenkins-2.121.1
sudo systemctl enable jenkins
sudo systemctl start jenkins
access using IP:8080

start a new project: with git as SCM
use the git repo
add build step: invoke gradle script; use gradle wrapper
add post build step: archive app

***triggering-builds-after-change***

Generate a personal access token from github.com
check  admin:repo_hook
copy API key
go to jenkins->manage jenkins->github->Add github server-> add jenkins credentials-> sselect secret-text kind-> paste api-> select ID from credentials->save
configure project-> select GitHub hook trigger for GITScm polling in Build triggers
check github-repo settings for webhooks

***pipeline-build***
usng Jenkinsfile

***pipeline-deploy***
install publish over ssh plugin
manage jenkins->publish over ssh->add SSH servers (staging & production)
so that code can be sent to these servers for deployment


(adduser deploy
echo "deploy:jenkins" | chpasswd
groupadd train-schedule
usermod -a -G train-schedule deploy
echo "deploy ALL=(ALL) NOPASSWD: /usr/bin/systemctl stop train-schedule" >> /etc/sudoers
echo "deploy ALL=(ALL) NOPASSWD: /usr/bin/systemctl start train-schedule" >> /etc/sudoers
echo -e "[Unit]\\nDescription=Train Schedule\\nAfter=network.target\\n\\n[Service]\\n\\nType=simple\\nWorkingDirectory=/opt/train-schedule\\nExecStart=/usr/bin/node bin/www\\nStandardOutput=syslog\\nStandardError=syslog\\nRestart=on-failure\\n\\n[Install]\\nWantedBy=multi-user.target" > /etc/systemd/system/train-schedule.service
/usr/bin/systemctl daemon-reload
mkdir -p /opt/train-schedule
chown root:train-schedule /opt/train-schedule
chmod 775 /opt/train-schedule/
yum -y install nodejs unzip)

run these commands on both staging and production server

then add credentials to jenkins, so that it can ssh into both these servers:
credentials->Jenkins->global credentials->Add credentials->type the username and password added above


create a new multibranch pipeline project
add source: GitHub
add credentials: jenkins scope
username: navypandora
password: api token
owner: navypandora
select repo
save

Jenkinsfile:
build-automation
deploy to staging
prompt for deployment to production
deploy to production
check using IP



***docker***
used for orchestration because containers are lightweight and portable, and be very easily scaled up and down
configuration drift

FROM<image name> - sets the parent image
WORKDIR<directory path> - sets the current working directory inside the container image for
other commands
COPY<source><destination> - copies file from the host into the container image
RUN<command> - executes a command within the container image
EXPOSE<port> - tells docker that the software in the container listens on a particular port
CMD<array of command arguments> - sets the command that is executed by the container when it is run.

using a dockerfile copy all the code to the docker image, expose the app's' port number
run the docker container using the image, and map docker port to system port.

install docker on jenkins server
give jenkins user permission to use docker
by:
groupadd docker (docker will recognize this)
usermod -G docker jenkins
systemctl restart jenkins
systemctl restart docker

***deployment-using-docker***

In Jenkinsfile:
build-automation
Build docker image
push the docker image to the registry
in the staging server:
pull the docker image, run it with exposing the port 8080:8080 with tag --restart-always

***deployment-using-kubernetes***

install kubernetes CD plugin in jenkins
add credentials->Kind: kubernetes configuration, ID: kubeconfig, Kubeconfig: Enter directly: paste entire contents of ¬/.kube/config file here.
create a new multibranch pipeline

make a kubernetes yaml file with details of the app
with 2 kinds: service & deployment

make the changes in Jenkinsfile:
deployment to production:
input the yml file of kubernetes configuration.

***Monitoring***
INFRASTRUCTURE monitoring: CPU load, memory, health, disk usage, etc.
Application performance monitoring: requests per minute, error rate, average response rate, etc.
prometheus gathers and stores monitoring data, it also provides alerting.
grafana will let us display and build dashboards for the data

we will be using helm for installing prometheus and grafana within our kubernetes cluster.s

***installig-prometheus-and-grafana***
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > /tmp/get_helm.sh
chmod 700 /tmp/get_helm.sh
DESIRED_VERSION=v2.8.2 /tmp/get_helm.sh
helm init --wait
kubectl --namespace=kube-system create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default
helm ls
cd ~/
git clone https://github.com/kubernetes/charts
cd charts
git checkout efdcffe0b6973111ec6e5e83136ea74cdbe6527d
cd ../
vi prometheus-values.yml:

	alertmanager:
	    persistentVolume:
	        enabled: false
	server:
	    persistentVolume:
	        enabled: false

helm install -f prometheus-values.yml charts/stable/prometheus --name prometheus --namespace prometheus
vi grafana-values.yml:
	adminPassword: password

helm install -f grafana-values.yml charts/stable/grafana/ --name grafana --namespace grafana
vi grafana-ext.yml:
	kind: Service
	apiVersion: v1
	metadata:
	  namespace: grafana
	  name: grafana-ext
	spec:
	  type: NodePort
	  selector:
	    app: grafana
	  ports:
	  - protocol: TCP
	    port: 3000
	    nodePort: 8080

kubectl apply -f grafana-ext.yml
kubectl get pods -n prometheus
kubectl get pods -n grafana

prometheus url: http://prometheus-server.prometheus.svc.cluster.local


***how-to-monitor***
one way to get monitoring data from Applications is to instrument the applications themselves to provide data
there is a nodejs prometheus client library called prom-client that is being used to instrument the app.

import a dashboard.


in the train-schedule-kube.yml file add:
kind: Service
	metadata:
		annotations:
		  prometheus.io/scrape: 'true'

kubctl apply -f train-schedule-kube.yml

Create a new graph witha  fucnction
setup alerts

***kubernetes-self-healing***

liveness probes: custom checks which are periodically run against containers to detect whether or not they are healthy.
in the train-schedule-kube.yml file add:
- containerPort:80
 livenessProbe:
          httpGet:
            path: /
            port: 8080
          initialDelaySeconds: 15 (how much to wait before check start)
          timeoutSeconds: 1 (expected response time)
          periodSeconds: 10 (time between each check)

***Autoscaling***

Autoscaling in kubernetes can be implemented using a Horizontal Pod autoscaler.
HPAs work with  the metrics API to periodically check metrics and perform Autoscaling according to the HPA configuration.
Steps to implement autoscaling  based on CPU usage  with an HPA:
 install metrics api
 set a resource request for the pods that will be autoscaled
 create an HPA

Install metrics server:
cd ~/
git clone https://github.com/kubernetes-incubator/metrics-server.git
cd metrics-server/
kubectl create -f deploy/1.8+/
kubectl get --raw /apis/metrics.k8s.io/

vi train-schedule-kube.yml:
	        resources:
	          requests:
	            cpu: 200m (benchmark/highest for the pods)

	---

	apiVersion: autoscaling/v2beta1
	kind: HorizontalPodAutoscaler
	metadata:
	  name: train-schedule
	  namespace: default
	spec:
	  scaleTargetRef:
	    apiVersion: apps/v1
	    kind: Deployment
	    name: train-schedule-deployment
	  minReplicas: 1
	  maxReplicas: 4
	  metrics:
	  - type: Resource
	    resource:
	      name: cpu
	      targetAverageUtilization: 50 (the autoscaler will make sure that avergae of cpu usage of all the pods is gonna be 50%)

kubectl get hpa(get average usage)

***canary-testing***

pushing new code  to a small group of users.
deploy the same application of the different version with track: canary instead of stable
basically deploy a new app to the public for testing