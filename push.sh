#!/usr/bin/env bash
docker tag rust-runner ghcr.io/mentics/rust-runner:latest
echo "Logging into github container registry. Please enter your access token."
docker login ghcr.io --username mentics
docker push ghcr.io/mentics/rust-runner:latest
