#!/usr/bin/env bash

docker build -t localhost:5000/xcellenthublocal/jenkins:1.0 -t localhost:5000/xcellenthublocal/jenkins:latest .

docker images | grep xcellenthublocal/jenkins
