#!/bin/bash
#
# Usage:
#
#   ./tools/download_camelyon16.sh
#
# NOTE: Copy your `client_secret.json` into the `./tools` folder before running
# this script. For more details about this file, see the dataset's README.
set -e

ROOT_DIR=/opt/FLamby

./tools/run_in_docker.sh python \
    $ROOT_DIR/flamby/datasets/fed_camelyon16/dataset_creation_scripts/download.py \
    --output-folder /central_data/flamby/camelyon16 \
    --path-to-secret $ROOT_DIR/tools/client_secret.json \
    --port 6006
