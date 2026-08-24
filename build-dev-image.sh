#!/bin/bash

docker buildx build . -f deployments/ticdc/docker/Dockerfile -t hub.pingcap.net/kvaas/ticdc:v8.5 --push
