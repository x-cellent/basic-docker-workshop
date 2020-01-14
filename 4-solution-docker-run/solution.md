Exercise: docker run
====================

1. start the created Images

    - xcellenthub/whalesay:2.0
    - xcellenthub/jenkins:1.0
    - xcellenthub/identicon:1.0
    - xcellenthub/countdown:1.0

1. Enter the images and explore on which port the jenkins server is listening inside the container 

    - hint: configfile / nsenter + netstat

1. Map this port with the run command to the docker host 

1. Verify the port mapping

1. Optional: Which user and rights do you have inside the container?

1. Optional: Which user owns a file on the hostsystem, that was created inside the container

    - hint: mount a hostpath to the container

1. Optional: Install an application like "sl" or "nano" inside the running container. Is it still there, after the container got restarted? (kill + run)

Solution
========

Inspect the corresponding `docker-run.sh` files.