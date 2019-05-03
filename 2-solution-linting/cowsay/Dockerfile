FROM xcellenthub/whalesay:1.0

LABEL maintainer="Ferdinand Eckhard <ferdinand.eckhard@x-cellent.com>, Sandro Koll <sandro.koll@x-cellent.com>"

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    fortunes=1:1.99.1-7 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/sh", "-c"]

CMD ["/usr/games/fortune -a | cowsay"]

