# use python as image
FROM python:3.6

# add a "authors" label
LABEL authors="Ferdinand Eckhard <ferdinand.eckhard@x-cellent.com>, Sandro Koll <sandro.koll@x-cellent.com>" \
 org.opencontainers.image.authors="Ferdinand Eckhard <ferdinand.eckhard@x-cellent.com>, Sandro Koll <sandro.koll@x-cellent.com>"

# install the following packages with pip3: flask, redis, requests, uwsgi
RUN pip3 install     flask     redis     requests     uwsgi

WORKDIR /app

# copy the cmd-script (cmd.sh) into the image
COPY cmd.sh /

# copy the app folder (./app) into the image
COPY app/* /app/

# Expose the ports 9090 9091
EXPOSE 9090 9091

# Start the cmd-script
CMD ["/cmd.sh"]
