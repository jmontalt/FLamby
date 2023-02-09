#!/bin/bash
set -e

ROOT_DIR=$(dirname $(dirname $(realpath "$0")))
IMAGE="bayer-int/flamby:latest"

docker run \
    -it \
    --rm \
    --gpus all \
    --mount type=bind,source=/central_data,target=/central_data \
    --mount type=bind,source=$ROOT_DIR,target=/opt/FLamby \
    --ipc host \
    --network host \
    $IMAGE \
    "$@"
