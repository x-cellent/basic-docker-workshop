Exercise: Write your own Dockerfile!
====================================

Write the Dockerfile of an application, that prints out a given Text.

1) set base image: 
docker/whalesay

2) set the application, that should be executed inside the container (ENTRYPOINT vs. CMD): 
cowsay

Optional:
Install a Random Text generator and pipe the text to the application "cowsay".

1) install fortunes
2) pipe the output of the application /usr/games/fortune to cowsay
