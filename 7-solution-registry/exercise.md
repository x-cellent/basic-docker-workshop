Exercise: docker registry
=========================

Run own Registry:
-----------------

1) Run the registry 


2) Push the image to the registry


3) deleate the local image


4) Verify that it is deleated


5) run / pull the image


Tasks for base images:
----------------------

- compare Pull speed
- compare size
- start it and install something

base images:
- centos
- unix
- windows
- debian

Search
------

Search for an image with the application kibana, logstash and elasticsearch. Write a docker-run file for it.




Solution:
=========

Run own Registry:
-----------------

# run the registry
docker run -p 5000:5000 registry

# push the image to the registry
docker push localhost:5000/xcellenthublocal/jenkins:1.0

# deleate the local image
docker rmi localhost:5000/xcellenthublocal/jenkins

# Verify that it is deleated
docker images

# run / pull the image
docker pull localhost:5000/xcellenthublocal/jenkins:1.0
docker run localhost:5000/xcellenthublocal/jenkins:1.0



Tasks for base images:
----------------------

# compare Pull speed

docker pull centos
docker pull debian
docker pull alpine


# compare size

docker images

- centos = 202MB
- debian = 100
- alpine = 5.53MB
- busybox = 1.2MB

FROM scratch would be even smaller!

# start it and install something

docker run -it centos /bin/bash 
yum install -y nano

docker run -it debian /bin/bash 
apt-get update && apt-get install -y nano

docker run -it alpine /bin/bash 
apt-get update && apt-get install -y nano

docker run -it busybox /bin/sh
wget PACKAGE-URL
dpkg -i PACKAGE.deb

# base images:
- centos
- debian
- alpine
- busybox

Search
------

docker search kibana
docker search logstash
docker search elasticsearch

look at the docker-run.sh file for the run command.
