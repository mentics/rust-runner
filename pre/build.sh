#!/usr/bin/env bash
docker build --progress plain --build-arg DOCKER_GROUP_ID=$(IFS=: read _ _ ID _ <<< `getent group docker` && echo $ID) -t rust-runner-pre .
