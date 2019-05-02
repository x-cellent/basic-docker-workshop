FROM xcellenthub/whalesay:latest
MAINTAINER Ferdinand Eckard <ferdinand.eckhard@x-cellent.com>, Sandro Koll <sandro.koll@x-cellent.com>
RUN apt-get update
RUN apt-get install -y fortunes
CMD /usr/games/fortune -a | cowsay
