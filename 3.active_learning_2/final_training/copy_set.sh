#!/bin/sh

ln -s ../training_step_2/training_iter_4/train.xyz .
cp ../init/init.trajectory.xyz test.xyz
for i in $(seq 1 4)
do
    cat ../training_step_1/training_iter_"$i"/accepted_structures.xyz >> test.xyz
    cat ../training_step_2/training_iter_"$i"/accepted_structures.xyz >> test.xyz
done
