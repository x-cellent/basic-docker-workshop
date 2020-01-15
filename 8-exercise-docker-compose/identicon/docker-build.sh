#!/usr/bin/env bash

docker build -t xcellenthub/identicon:1.0 -t xcellenthub/identicon:latest .

docker images | grep xcellenthub/identicon