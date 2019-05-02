FROM xcellenthub/whalesay:latest
MAINTAINER Ferdinand.Eckhard@x-cellent.com
RUN apt-get -y update && apt-get install -y fortunes
CMD /usr/games/fortune -a | cowsay
