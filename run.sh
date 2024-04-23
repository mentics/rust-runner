#!/usr/bin/env bash
docker run -it --userns-remap=docker:docker -v /var/run/docker.sock:/var/run/docker.sock rust-runner
