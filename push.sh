#!/usr/bin/env bash
sudo docker tag rust-runner ghcr.io/mentics/rust-runner:latest
echo "Logging into github container registry. Please enter your access token."
sudo docker login ghcr.io --username mentics
sudo docker push ghcr.io/mentics/rust-runner:latest
