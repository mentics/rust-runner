#!/usr/bin/env bash
docker run -it -v /var/run/docker.sock:/var/run/docker.sock rust-runner
