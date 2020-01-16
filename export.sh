#!/usr/bin/env bash

set -e

docker save -o dnmonster amouat/dnmonster:1.0
docker save -o redis redis
docker save -o identicon xcellenthub/identicon:1.0
docker save -o reverse-proxy xcellenthub/reverse-proxy:1.0
docker save -o logstash logstash:7.0.0
docker save -o logspout amouat/logspout-logstash
docker save -o elasticsearch elasticsearch:7.0.0
docker save -o kibana kibana:7.0.0
docker save -o cadvisor google/cadvisor
docker save -o prometheus prom/prometheus
