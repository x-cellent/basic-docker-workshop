#!/usr/bin/env bash

docker build -t xcellenthub/countdown:1.0 xcellenthub/countdown:latest .

docker images | grep xcellenthub/whalesay