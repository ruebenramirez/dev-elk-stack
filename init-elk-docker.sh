#!/bin/bash

# https://registry.hub.docker.com/u/qnib/elk/

docker pull qnib/elk

docker rm -f elk

# To get all the /dev/* devices needed for sshd and alike:
export DEV_MOUNTS="-v /dev/null:/dev/null -v /dev/urandom:/dev/urandom -v /dev/random:/dev/random"
export DEV_MOUNTS="${DEV_MOUNTS} -v /dev/full:/dev/full -v /dev/zero:/dev/zero"
### OPTIONAL -> if you want to store Elasticsearchs data outside 
mkdir ${HOME}/elasticsearch
export ES_PERSIST="-v ${HOME}/elasticsearch:/var/lib/elasticsearch"
### OPTIONAL -> set the external port to something else then 80
export HTTP_PORT="-e HTTPPORT=8080 -p 8080:80"
### OPTIONAL -> To secure kibana and elasticsearch user/passwd could be set
# if a user is set and no passwd, the user will be set as password
export HTUSER=kibana
export HTPASSWD=secretpw

docker run -d \
    -h elk \
    --name elk \
    --privileged \
    ${DEV_MOUNTS} \
    ${HTTP_PORT} \
    -e HTUSER=${HTUSER} \
    -e HTPASSWD=${HTPASSWD} \
    ${ES_PERSIST} \
    qnib/elk:latest

echo 'message2' | nc -w 1  192.168.59.103 5514

docker logs -f elk
