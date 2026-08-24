#!/bin/bash

docker buildx build . -f deployments/sync-diff-inspector.Dockerfile -t hub.pingcap.net/kvaas/sync-diff-inspector:latest --push
