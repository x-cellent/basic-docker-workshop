# 1) start the created Images

docker run -it xcellenthub/countdown:1.0



# 2) Enter the images and explore it

docker run -it xcellenthub/countdown:1.0 /bin/bash



# 3) Map this port with the run command to the docker host

# countdown has no open ports! Skip



# 4) Verify the port mapping

# countdown has no open ports! Skip



# 5) Optional: Which user and rights do you have inside the container?

id
# uid=0(root) gid=0(root) groups=0(root)

# Filesystem rights:
touch /tmp/test.txt
ls -ll /tmp/test.txt
# -rw-r--r-- 1 root root 0 May  6 08:11 /tmp/test.txt

exit



# 6) Optional: Which user owns a file on the hostsystem, that was created inside the container
# - hint: mount a hostpath to the container

docker run -it -v /tmp/share/:/hostShare/ xcellenthub/countdown:1.0 /bin/bash
touch /hostShare/test.txt
ls -ll /hostShare/test.txt
exit
ls -ll /tmp/share/test.txt

# Result: Started the container as normal user, but the created files on the hostsystem by the container are owned by root. The Container also has acess to root owned files!



# 7) Optional: Install an application like "sl" or "nano" inside the running container. Is it still there, after the container got restarted? (kill + run)

docker run -it xcellenthub/countdown:1.0 /bin/bash
apt-get update
apt-get install nano
nano
exit

docker run -it xcellenthub/countdown:1.0 /bin/bash
nano

# Result: Modifications to a running container does not apply on the image!



