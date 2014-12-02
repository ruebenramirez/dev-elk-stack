#!/bin/bash

docker pull dockerfile/elasticsearch
docker pull balsamiq/docker-kibana

docker rm -f elasticsearch
docker rm -f kibana

docker run -d \
    -p 9200:9200 \
    -p 9300:9300 \
    --name elasticsearch \
    dockerfile/elasticsearch

docker run -d \
    -p 9888:80 \
    -e KIBANA_SECURE=false \
    --link elasticsearch:es \
    --name kibana \
    balsamiq/docker-kibana

