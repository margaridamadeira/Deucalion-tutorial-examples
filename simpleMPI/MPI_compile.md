# Getting started with MPI

## MPI standard and implementations

In the [MPI Forum](https://www.mpi-forum.org) web site, one can find information concerning MPI standards. This information includes links to the official versions of the standards, and references to the current MPI efforts, including information about implementation status.

Currently (Out/2025) the [current](https://www.mpi-forum.org/implementation-status/) status of various MPI implementations is presented, identifying the features implemented on different versions of the MPI Standard.


## How to get an MPI library

When using a supercomputer, the command `module spider MPI` will likely present several alternatives. When using a Linux distribution, binary packages may be available. 

The selection of the tool chain may be done according to the operating system and underlying hardware. You may want to preview the [setup] (https://rantahar.github.io/introduction-to-mpi/setup.html) recommendations for a local install.



## How to compile and run code

Generally, one uses: `mpicc` to compile MPI C code; `mpifort` to compile MPI Fortran code.

Executing the code in a single machine can be done using `mpirun` or `mpiexec`.

## Notes on local examples

Local code was first run on a Debian WSL. MPI install was achieved with `# apt install openmpi-bin libopenmpi-dev`. 

Use the command `source test_local_install.sh` to verify your installation. 
First, one will see the result of an `echo` command that was issued four times.
Next, the `hello_mpi.c` will be compiled and one will see the result of the execuction. 

## Notes on using Deucalion

Deucalion is a portuguese supercomputer of CNCA and its use is made available by the portuguese HPC-VLab iniciative and the EuroCC2 Portugal project.




   

