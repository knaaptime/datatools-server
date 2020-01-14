#!/bin/sh
set -e

# Build image
echo Building GTFS EDITOR Backend
docker build --tag="opentransport/gtfs-editor-backend:builder" -f Dockerfile.builder .

docker run --rm --entrypoint tar "opentransport/gtfs-editor-backend:builder" -c target|tar x -C ./
#package GTFS EDITOR backend quietly while keeping travis happpy
docker build --tag="opentransport/gtfs-editor-backend" -f Dockerfile .