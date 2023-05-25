#!/bin/sh

rm -f initial_training_set.xyz
python ../data/split.py \
       -i init.trajectory.xyz \
       --ranges "0:500" \
       --nframes 40 >> initial_training_set.xyz
