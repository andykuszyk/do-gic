#!/bin/bash
sed -i "s/\[gitlab-token\]/$gitlabToken/g" docker-compose.yml
scp -i id_rsa -o "StrictHostKeyChecking no" ./docker-compose.yml $douser@$doip:~/docker-compose.yml
ssh -i id_rsa -o "StrictHostKeyChecking no" $douser@$doip "docker stack deploy -c ~/docker-compose.yml szyk"
