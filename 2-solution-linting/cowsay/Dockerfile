FROM xcellenthub/whalesay:1.0
RUN apt-get -y update \
    & apt-get install -y --no-install-recommends fortunes=1:1.99.1-7 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
CMD ["/usr/games/fortune", "-a", "|", "cowsay"]
