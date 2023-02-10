#!/bin/bash
#
# Usage:
#
#   ./tools/benchmark_fed_camelyon16.sh
#
# NOTE: Run this AFTER downloading with ./tools/download_camelyon16.sh
# and preprocessing with ./tools/preprocess_camelyon16.sh.
set -e

WORKDIR=/workspace

for SEED in 42 43 44 45 46
do
    ./tools/run_in_docker.sh python \
        $WORKDIR/flamby/benchmarks/fed_benchmark.py \
        --seed $SEED \
        -cfp $WORKDIR/flamby/config_camelyon16.json
done
