import somd
import mdtraj

system = somd.core.systems.create_system_from_pdb('../data/topo.pdb')

siesta_options = """
xc.functional          GGA
xc.authors             revPBE

PAO.BasisSize          DZP
Mesh.Cutoff            300 Ry
PAO.EnergyShift        10 meV
PAO.SoftDefault        T

# SCF options
SCF.Mixer.Variant      Pulay
SCF.Mixer.History      8
DM.NumberPulay         8
DM.Tolerance           1.d-5
DM.UseSaveDM           T
DM.History.Depth       5

Diag.Algorithm         ELPA-1stage
SolutionMethod         diagon
ElectronicTemperature  1 meV
"""
siesta_command = 'mpirun -np 4 /path/to/siesta'
p1 = somd.potentials.create_siesta_potential(system, range(0, system.n_atoms),
                                             siesta_options, siesta_command,
                                             '../data')
p2 = somd.potentials.DFTD3(range(0, system.n_atoms), system.atomic_types,
                           'revpbe')
system.potentials.append(p1)
system.potentials.append(p2)

traj = mdtraj.load_xyz('../data/C2H6.test.xyz', top='../data/topo.pdb')

with open('energy_siesta.txt', 'w') as fp:
    for i in range(0, traj.n_frames):
        system.positions[:] = traj.xyz[i][:]
        system.update_potentials()
        print(i, system.energy_potential, file=fp)

system.potentials.clear()

for i in range(0, 4):
    p = somd.potentials.NEP(
        range(0, system.n_atoms),
        '../train/train_iter_8/potential_{:d}/nep.txt'.format(i),
        system.atomic_symbols)
    system.potentials.append(p)

with open('energy_nep.txt', 'w') as fp:
    for i in range(0, traj.n_frames):
        system.positions[:] = traj.xyz[i][:]
        system.update_potentials()
        print(i, file=fp, end=' ')
        for j in range(0, 4):
            print(system.potentials[j].energy_potential[0], file=fp, end=' ')
        print('\n', file=fp, end='')
