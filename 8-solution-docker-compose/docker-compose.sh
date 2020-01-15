#!/usr/bin/env bash

set -e

docker-compose up -d
sleep 20
docker-compose -f docker-compose2.yaml up -d
sleep 5
docker-compose -f docker-compose3.yaml up -d
