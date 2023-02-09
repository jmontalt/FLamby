#!/bin/bash
#
# Usage:
#
#   ./tools/benchmark_camelyon16.sh
#
# NOTE: Run this AFTER downloading with ./tools/download_camelyon16.sh
# and preprocessing with ./tools/preprocess_camelyon16.sh.
set -e

ROOT_DIR=/opt/FLamby

./tools/run_in_docker.sh python \
    $ROOT_DIR/flamby/datasets/fed_camelyon16/benchmark.py \
    --log \
    --num-workers-torch 8
