#!/bin/bash

# does the dir exist
if [ ! -d data ]; then
    mkdir data
fi

# have we already downloaded shakespeare?
if [ ! -f data/shakespeare.json ]; then
    curl -o data/shakespeare.json http://www.elasticsearch.org/guide/en/kibana/current/snippets/shakespeare.json
fi

# put the data into elasticsearch
curl -XPUT localhost:9200/_bulk --data-binary @data/shakespeare.json


