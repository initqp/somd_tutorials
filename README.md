# Tutorials for the SOMD code

This repo contains some tutorials of the [SOMD](https://github.com/initqp/somd)
code. Going through these tutorials will make you familiar with SOMD quickly.

## Contents
### [Basic tutorial](./1.basic/README.md)
In this tutorial we will calculate the oxygen−oxygen radial distribution
function of bulk waters. By finishing this tutorial, you may earn some basic
sense about performing MD simulations with SOMD.

### [Building Neuroevolution Potentials with active learning, part I](./2.active_learning_1/README.md)
In this tutorial we will try to fit non-reactive Neuroevolution Potentials
(NEPs) of an isolated ethane molecule, by the mean of the active learning
methodology. The metadynamics method will also be invoked to accelerate
the configuration space sampling.

### [Building Neuroevolution Potentials with active learning, part II](./3.active_learning_2/README.md)
In this tutorial we will try to fit reactive Neuroevolution Potentials
(NEPs) for the symmetric $CH_3Cl + Cl^- -> Cl^- + CH_3Cl$ reaction within an
explicit water box, by the mean of the active learning methodology. Steered MD
and metadynamics methods will be invoked to accelerate the configuration space
sampling.

## How to run
First, make sure that each pre-required package has been installed. Then clone
this repo:
```bash
git clone https://www.github.com/initqp/somd_tutorials
```
You can find instructions for each tutorial from the `README.md` file in the
corresponding directory.

## Pre-requirements
Before running these tutorials, make sure that following packages has been
properly installed.

### SOMD
Make sure that SOMD has been properly installed.
```python
>>> import somd
>>> print(somd.__version__)
# version string here
```
If the package has been installed, a version string should be printed.
Otherwise, follow the instructions in the
[main repo](https://www.github.com/initqp/somd) to install it.

### DFTD3
Start a `python` REPL and enter following lines:
```python
>>> import dftd3
>>> print(dftd3.__version__)
# 0.6.0
```
If the package has been installed, a version string should be printed.
Otherwise, install it with:
```bash
conda install dftd3-python -c conda-forge
```
or
```bash
pip install dftd3
```

### PLUMED
The enhanced sampling methods in SOMD are provided by the PLUMED package. Thus,
to complete this tutorial, the PLUMED package and its python wrapper must be
installed. Start a `python` REPL and enter following lines:
```python
>>> import plumed
>>> plumed.Plumed()
# +++ Loading the PLUMED kernel runtime +++
# +++ PLUMED_KERNEL="/path/to/libplumedKernel.so" +++
```
If the packages have been properly installed, the path to the PLUMED kernel
library will be printed. Otherwise, you should compile the PLUMED main package
(following instructions
[here](https://www.plumed.org/doc-v2.8/user-doc/html/_installation.html))
or install it through Conda:
```bash
conda install plumed -c conda-forge
```
Once you have the PLUMED main package installed, you should set the
`PLUMED_KERNEL` environment variable to the actual path of the
`libplumedKernel.so` file:
```bash
export PLUMED_KERNEL=/path/to/libplumedKernel.so
```
You also may need to add the above command to your `bashrc` file for later
usages (if you installed your PLUMED main package via Conda, this kernel
library should be located at the library directory of Conda, e.g.,
`/conda/prefix/lib/libplumedKernel.so`). Finally, install the PLUMED python
wrapper with following commands (if you could figure out how to compile the
wrapper by yourself, just skip this step):
```bash
conda install py-plumed -c conda-forge
```
or
```bash
pip install plumed
```
