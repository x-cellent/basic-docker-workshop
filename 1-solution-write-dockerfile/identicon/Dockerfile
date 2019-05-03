FROM python:3.6

LABEL authors="Ferdinand Eckhard <ferdinand.eckhard@x-cellent.com>, Sandro Koll <sandro.koll@x-cellent.com>"

RUN pip3 install \
    flask \
    redis \
    requests \
    uwsgi

WORKDIR /app

COPY cmd.sh /
COPY app/* /app/

EXPOSE 9090 9091

CMD ["/cmd.sh"]
