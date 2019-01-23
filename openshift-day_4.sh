Creaating multiple Docker hosts to launch different containers.
To manage a cluster of Docker Engines/hosts, Applications like Docker Swarm, Mesos Marathon, Kubernetes
In order to manage kubernetes cluster, openshift is used (web Application or Command line)



Login to openshift master from workstation
oc login -u admin -p redhat https://master.lw.com

oc whoami

to create a new openshift user:
go to master system:
htpasswd /etc/origin/master/htpasswd   kanishk

cat /etc/origin/master/htpasswd (details of all users)

oc new-project mytest(create a new project)
oc projects(show projects)

Don't' give the power of Creating projects to users.

ocm adm policy remove-cluster-role-from-group self-provisioner system:authenticated  system:authenticated:oauth (no one can create a project except the admin)

oc new-project test1
oc project(show current project)
oc policy add-role-to-user edit kanishk (give the power of editing the project to the user)
oc policy add-role-to-user view harry (harry can only view the project)

oc get pods (show the Applications running)
on new-app --name hello  http://git.lw.com/scaling (start a new Application and get the code from the respective git server)

oc get bc (build configuration)
oc describe bc(get details of build configuration)

oc get dc (deployment configuration)
oc describe dc(get details of deployment configuration)

oc  scale --replicas=5  dc   test1   (create replicas of the Application)

Load Balancer=SVC
Load balancer is a container which runs on the master(which is connected through PAT)
oc expose service  myweb  --hostname=xyz.apps.lab.example.com


To encrypt a web server:
create a private key, then create a public key, then create a certificate.


