#!/bin/sh

rm -f tmp.xyz
python ../data/split.py \
       -i init.trajectory.xyz \
       --ranges "0:3000,3000:5000,5000:10000,10000:14000" \
       --nframes 500 \
       --perrange >> tmp.xyz
python ../data/split.py \
       -i tmp.xyz \
       --ranges "0:1500" > initial_training_set.xyz
python ../data/split.py \
       -i tmp.xyz \
       --ranges "1500:2000" > initial_testing_set.xyz
rm -f tmp.xyz
