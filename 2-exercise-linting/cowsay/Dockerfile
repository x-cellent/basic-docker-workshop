FROM xcellenthub/whalesay:latest
MAINTAINER Ferdinand Eckard <ferdinand.eckhard@x-cellent.com>, Sandro Koll <sandro.koll@x-cellent.com>
RUN apt-get -y update && apt-get install -y fortunes fortune-mod
CMD /usr/games/fortune | cowsay

