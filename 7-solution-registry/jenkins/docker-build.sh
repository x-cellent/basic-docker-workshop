#!/usr/bin/env bash

docker build -t xcellenthub/jenkins:1.0 -t xcellenthub/jenkins:latest .

docker images | grep xcellenthub/jenkins