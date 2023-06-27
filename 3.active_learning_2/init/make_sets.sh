#!/bin/sh

rm -f initial_training_set.xyz
python ../data/split.py \
       -i init.trajectory.xyz \
       --ranges "0:3500,3500:4500,4500:10000,10000:14000" \
       --nframes 75 \
       --perrange >> initial_training_set.xyz
