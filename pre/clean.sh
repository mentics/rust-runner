#!/usr/bin/env bash

sudo docker rm -vf $(sudo docker ps -aq)
sudo docker rmi -f $(sudo docker images rust-runner-* -aq)
