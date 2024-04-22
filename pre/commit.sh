#!/usr/bin/env bash
docker commit $(sudo docker ps -alq) rust-runner-mid
