# FROM: which base image to use
# docker: user / organisation name in the docker-registry 
# whalesay: image name
# latest: version of the image
FROM xcellenthub/whalesay:latest

# add Random Context to be said by the application
# RUN:      Runs the following command
#           shell form, the command is run in a shell, which by default is /bin/sh -c on Linux or cmd /S /C on Windows
RUN apt-get -y update && apt-get install -y fortunes

# ENTRYPOINT:
ENTRYPOINT /bin/sh -c

# CMD:
CMD /usr/games/fortune -a | cowsay

