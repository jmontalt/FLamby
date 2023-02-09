#!/bin/bash
#
# Usage:
#
#   ./tools/download_camelyon16.sh
#
# NOTE: Copy your `client_secret.json` into the `./tools` folder before running
# this script. For more details about this file, see the dataset's README.
set -e

WORKDIR=/workspace

./tools/run_in_docker.sh python \
    $WORKDIR/flamby/datasets/fed_camelyon16/dataset_creation_scripts/download.py \
    --output-folder /central_data/flamby/camelyon16 \
    --path-to-secret $WORKDIR/tools/client_secret.json \
    --port 6006
