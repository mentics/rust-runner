#!/usr/bin/env bash
sudo docker commit $(sudo docker ps -alq) rust-runner-mid
