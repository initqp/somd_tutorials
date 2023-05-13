#!/bin/bash

rm -f barrier.dat
export PLUMED_MAXBACKUP=10000
plumed sum_hills --hills HILLS --stride 250 --min -5 --max 5 --bin 500 --mintozero
n_fes=$(find ./ -name "fes_*" | wc -l)
for n in $(seq 0 $((n_fes - 1)))
do
    f="./fes_$n.dat"
    {
    echo -e "$n   \c"
    grep "^ *0.000" "$f" | awk '{print($2)}'
    } >> barrier.dat
done
rm -f analysis* fes_*.dat
python << EOF
import numpy as np
data = np.loadtxt('barrier.dat')[75:, 1]
print('BARRIER HEIGHT: {:f} +- {:f} (kJ/mol)'.format(np.mean(data), np.std(data)))
EOF
