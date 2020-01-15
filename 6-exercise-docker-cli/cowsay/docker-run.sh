# Run the docker image with the entrypoint app
docker run xcellenthub/whalesay:2.0 

# Run own app inside the container (cowsay) with an argument (Hi)
docker run xcellenthub/whalesay:2.0 cowsay Hi 

docker run -it xcellenthub/whalesay:2.0 cowsay Hallo!

# docker:           The docker command
# run:              Run a command in a new container
# -i:               --interactive       Keep STDIN open even if not attached
# -t:               --tty               Allocate a pseudo-TTY
# docker-whale:     Name of the image
# cowsay:           Application inside the container
# Hallo!            Argument for the application     

# Enter the container
# docker run -it docker-whale /bin/bash

# 1) start the created Images

docker run -it xcellenthub/whalesay:2.0 cowsay Hallo!

# 2) Enter the images and explore it

docker run -it xcellenthub/whalesay:2.0 /bin/bash

# 3) Map this port with the run command to the docker host 

# whalesay has no open ports! Skip

# 4) Verify the port mapping

# whalesay has no open ports! Skip

# 5) Optional: Which user and rights do you have inside the container?

id
# uid=0(root) gid=0(root) groups=0(root)

# Filesystem rights:
touch /tmp/test.txt
ls -ll /tmp/test.txt
# -rw-r--r-- 1 root root 0 May  3 09:21 /tmp/test.txt

# Syscall Rights:




exit

# 6) Optional: Which user owns a file on the hostsystem, that was created inside the container
# - hint: mount a hostpath to the container

docker run -it -v /tmp/share/:/hostShare/ xcellenthub/whalesay:2.0 /bin/bash
touch /hostShare/test.txt
ls -ll /hostShare/test.txt
exit 
ls -ll /tmp/share/test.txt

# Result: Started the container as normal user, but the created files on the hostsystem by the container are owned by root. The Container also has acess to root owned files!


# 7) Optional: Install an application like "sl" or "nano" inside the running container. Is it still there, after the container got restarted? (kill + run)

docker run -it xcellenthub/whalesay:2.0 /bin/bash
sudo apt-get install sl
sl
exit

docker run -it xcellenthub/whalesay:2.0 /bin/bash
sl

# Result: Modifications to a running container do not affect the image!



