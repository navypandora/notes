The use of Linux containers to deploy applications is called containerization.
Containers leverage and share the host kernel
docker images / docker image ls
docker ps -a / docker containers ls --all

docker stack deploy -c docker-compose.yml getstartedlab
					   (details)		  (name)

A single container running in a service is called a task. 
Tasks are given unique IDs that numerically increment, up to the number of replicas you defined in docker-compose.yml
docker exec <container_name> ls (run a single command on a running container)
docker logs <container_name> (show the history of container)