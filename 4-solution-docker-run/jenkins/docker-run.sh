# 1) start the created Images

docker run -it xcellenthub/jenkins:1.0 cowsay Hallo!

# 2) Enter the images and explore it

docker run -it xcellenthub/jenkins:1.0 /bin/bash

# 3) Map this port with the run command to the docker host 

docker run -it xcellenthub/jenkins:1.0
# Output when starting the container:
# INFO: Started ServerConnector@5cc5b667{HTTP/1.1,[http/1.1]}{0.0.0.0:8080}

# OR

# get container id
docker ps
docker inspect -f '{{.State.Pid}}' 37f1dbb7f933
# ==> 6733
sudo nsenter -t 6733 -n netstat -tulpn
# tcp        0      0 0.0.0.0:50000           0.0.0.0:*               LISTEN      6779/java           
# tcp        0      0 0.0.0.0:8080            0.0.0.0:*               LISTEN      6779/java           
# udp        0      0 0.0.0.0:33848           0.0.0.0:*                           6779/java           
# udp        0      0 0.0.0.0:5353            0.0.0.0:*                           6779/java


# 4) Verify the port mapping

docker run -it -p 18080:8080 xcellenthub/jenkins:1.0
#visit http://127.0.0.1:18080 from hostsystem
#==> jenkins web gui

# 5) Optional: Which user and rights do you have inside the container?

id
# uid=1000(jenkins) gid=1000(jenkins) groups=1000(jenkins)

# Filesystem rights:
touch /tmp/test.txt
ls -ll /tmp/test.txt
# -rw-r--r-- 1 jenkins jenkins 0 May  3 10:58 /tmp/test.txt
touch /root/test.txt
# touch: cannot touch '/root/test.txt': Permission denied
ls -ll /
# drwx------   2 root root 4096 Mar 26 12:00 root
# ==> no root FS access

exit

# 6) Optional: Which user owns a file on the hostsystem, that was created inside the container
# - hint: mount a hostpath to the container

# that non root user jenkins can access it
sudo mkdir -p /tmp/share/
sudo chmod 777 /tmp/share/

docker run -it -v /tmp/share/:/hostShare/ xcellenthub/jenkins:1.0 /bin/bash
touch /hostShare/test.txt
ls -ll /hostShare/test.txt
exit 
ls -ll /tmp/share/test.txt
# -rw-r--r-- 1 user user 0 Mai  3 13:04 /tmp/share/test.txt
# Result: The jenkins user in the conttainer created it (id=1000), but outside its the host user "user" (id=1000)! so the Container created a file with my username on the hostsystem!

# 7) Optional: Install an application like "sl" or "nano" inside the running container. Is it still there, after the container got restarted? (kill + run)

docker run -it xcellenthub/jenkins:1.0 /bin/bash
sudo apt-get update
sudo apt-get install nano
nano --version
exit

docker run -it xcellenthub/jenkins:1.0 /bin/bash
nano --version

# Result: Modifications to a running container does not apply on the image!

