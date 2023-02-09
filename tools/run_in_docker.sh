#!/bin/bash
set -e

WORKDIR=$(dirname $(dirname $(realpath "$0")))
IMAGE="bayer-int/flamby:latest"

docker run \
    -it \
    --rm \
    --gpus all \
    --mount type=bind,source=/central_data,target=/central_data \
    --mount type=bind,source=$WORKDIR,target=/workspace \
    --ipc host \
    --network host \
    --workdir /workspace \
    $IMAGE \
    "$@"
