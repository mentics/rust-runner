#!/usr/bin/env bash
sudo docker run rust-runner-full echo
sudo docker export $(sudo docker ps -alq) | sudo docker import - rust-runner:latest
