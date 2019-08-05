Exercise: docker compose
========================

1) Start the encironment (prod.sh)
2) verify that its running
3) stop it
4) extend docker-compose.yaml 

The docker-compose.yaml alredy incluedes cowsay and kibana. extend it with the following components:

- elasticsearch
- identicon
- dnmonster
- redis
- jenkins
- reverse-proxy
- logstash (+logspout)

5) Verify that the docker-compose environment is running correctly
    - Get a clean environment: remove all images, stop all container
    - Start it with docker compose 
    - Verify that its working

Solution:
=========

Look at the docker-compose.yaml file

Run with docker-compose up

Exit with docker-compose down

Get a clean environment with: docker system prune -af

To verify the environment, look at the picture of the components and visit the open ports for activity.

