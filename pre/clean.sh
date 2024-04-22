#!/usr/bin/env bash

docker rm -vf $(sudo docker ps -aq)
docker rmi -f $(sudo docker images rust-runner-* -aq)
