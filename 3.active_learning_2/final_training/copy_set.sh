#!/bin/sh

ln -s ../training_step_2/training.active_learning.dir/iteration_6/train.xyz .
cp ../init/init.trajectory.xyz test.xyz
for i in $(seq 1 3)
do
    cat ../training_step_1/training.active_learning.dir/iteration_"$i"/accepted_structures.xyz >> test.xyz
done
for i in $(seq 1 6)
do
    cat ../training_step_2/training.active_learning.dir/iteration_"$i"/accepted_structures.xyz >> test.xyz
done
