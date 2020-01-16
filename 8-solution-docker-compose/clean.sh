#!/usr/bin/env bash

set +e

docker system prune -f

docker rm -f dnmonster >/dev/null 2>&1
docker rm -f redis >/dev/null 2>&1
docker rm -f identicon >/dev/null 2>&1
docker rm -f reverse-proxy >/dev/null 2>&1
docker rm -f logstash >/dev/null 2>&1
docker rm -f kibana >/dev/null 2>&1
docker rm -f cadvisor >/dev/null 2>&1
docker rm -f prometheus >/dev/null 2>&1
docker rm -f logspout >/dev/null 2>&1
docker rm -f elasticsearch >/dev/null 2>&1
