#!/usr/bin/env bash

set +e

docker system prune -f

docker rm -f dnmonster
docker rm -f redis
docker rm -f identicon
docker rm -f reverse-proxy
docker rm -f logstash
docker rm -f kibana
docker rm -f cadvisor
docker rm -f prometheus
docker rm -f logspout
docker rm -f elasticsearch
