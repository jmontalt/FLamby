#!/bin/bash
#
# Usage:
#
#   ./tools/preprocess_camelyon16.sh
#
# NOTE: Run this AFTER downloading with ./tools/download_camelyon16.sh
set -e

WORKDIR=/workspace

./tools/run_in_docker.sh python \
    $WORKDIR/flamby/datasets/fed_camelyon16/dataset_creation_scripts/tiling_slides.py \
    --batch-size 64 \
    --num-workers-torch 8
