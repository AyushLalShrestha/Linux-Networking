# DevOps Roadmap
 # Hello DOCKER

docker container run -d --name nginx nginx

docker container run --publish 80:80 --detach --namewebhost nginx
docker container run --publish 8888:80 --name webhost -d nginx:1.11 nginx -T

docker container rm -f <CONTAINER_ID>
docker container top
docker container inspect nginx
docker container stats

<!-- run ssh and commands from inside a container -->
docker container run -it --name proxy nginx bash

