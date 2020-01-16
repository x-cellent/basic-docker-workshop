#!/usr/bin/env bash

set -e

docker load -i dnmonster
docker load -i redis
docker load -i identicon
docker load -i reverse-proxy
docker load -i logstash
docker load -i logspout
docker load -i elasticsearch
docker load -i kibana
docker load -i cadvisor
docker load -i prometheus
