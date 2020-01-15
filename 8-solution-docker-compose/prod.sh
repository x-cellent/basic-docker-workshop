#!/usr/bin/env bash

set +e

./clean.sh

set -e

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
  xcellenthub/identicon:1.0

docker run -d \
  --name reverse-proxy \
  --restart=always \
  --env NGINX_HOST=localhost \
  --env NGINX_PROXY=http://identicon:80 \
  --link identicon:identicon \
  --publish 10080:80 \
  xcellenthub/reverse-proxy:1.0

docker run -d \
  --name logstash \
  --env LOGSPOUT=ignore \
  --volume $PWD/logging/logstash.conf:/etc/logstash.conf \
  --publish 5000:5000 \
  --publish 5544:5544 \
  logstash:7.0.0 \
  -f /etc/logstash.conf

docker run -d \
  --name kibana \
  --env LOGSPOUT=ignore \
  --env ELASTICSEARCH_URL=http://elasticsearch:9200 \
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
  --config.file=/prometheus.conf

sleep 40

docker run -d \
  --name logspout \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume /var/run:/var/run:rw \
  --publish 8000:80 \
  --link logstash \
  amouat/logspout-logstash \
  logstash://logstash:5000

sleep 2

docker run -d \
  --name elasticsearch \
  --env LOGSPOUT=ignore \
  --env ES_JAVA_OPTS="-Xms512m -Xmx512m" \
  --env discovery.type=single-node \
  --env node.name=localhost \
  --env discovery.seed_hosts=localhost \
  --env bootstrap.memory_lock=false \
  --publish 9200:9200 \
  --publish 9300:9300 \
  elasticsearch:7.0.0

echo "OK"
