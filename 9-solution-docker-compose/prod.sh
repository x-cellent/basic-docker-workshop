#!/bin/bash

set -e

docker system prune -f

echo "Starting identicon system..."

docker run -d \
  --name dnmonster \
  --restart=always \
  amouat/dnmonster:1.0

docker run -d \
  --name redis \
  --restart=always \
 redis

docker run -d \
  --name identicon \
  --restart=always \
  --link dnmonster:dnmonster \
  --link redis:redis \
  identicon:1.2

docker run -d \
  --name identicon-proxy \
  --restart=always \
  --env NGINX_HOST=localhost \
  --env NGINX_PROXY=http://identicon:9090 \
  --link identicon:identicon \
  --publish 80:80 \
  identicon-proxy

docker run -d \
  --name logspout \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume /var/run:/var/run:rw \
  --publish 8000:80 \
  amouat/logspout-logstash \
  logstash://logstash:5000

docker run -d \
  --name logstash \
  --env LOGSPOUT=ignore \
  --volume $PWD/logging/logstash.conf:/etc/logstash.conf \
  --publish 127.0.0.1:5544:5544 \
  logstash:7.0.0 \
  -f /etc/logstash.conf

docker run -d \
  --name elasticsearch \
  --env LOGSPOUT=ignore \
  elasticsearch:7.0.0

docker run -d \
  --name kibana \
  --env LOGSPOUT=ignore \
  --env ELASTICSEARCH_URL=http://elasticsearch:9200 \
  --link elasticsearch \
  --publish 5601:5601 \
  kibana:7.0.0

docker run -d \
  --name cadvisor \
  --volume /:/rootfs:ro \
  --volume /var/run:/var/run:rw \
  --volume /sys:/sys:ro \
  --volume /var/lib/docker:/var/lib/docker:ro \
  --publish 8080:8080 \
  google/cadvisor

docker run -d \
  --name prometheus \
  --volume $PWD/monitoring/prometheus.conf:/prometheus.conf \
  --link cadvisor:cadvisor \
  --publish 9090:9090 \
  prom/prometheus \
  -config.file=/prometheus.conf

echo "OK"
