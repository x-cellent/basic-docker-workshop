#!/usr/bin/env bash

docker build -t xcellenthub/dnmonster:1.0 -t xcellenthub/dnmonster:latest .

docker images | grep xcellenthub/dnmonster