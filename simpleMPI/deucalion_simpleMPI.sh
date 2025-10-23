#!/bin/bash
## If you want to be updated by mail
#SBATCH --mail-user=mmadeira@ualg.pt
#SBATCH --mail-type=ALL

#SBATCH --job-name=hello_mpi         # Job name
#SBATCH --partition=normal-arm               # Partition to submit to
#SBATCH --account=F202500006HPCVLABUALGA
#SBATCH --nodes=1                     # Run on a single node
#SBATCH --ntasks=20                   # Only one task (OpenMP uses threads, not tasks)
#SBATCH --cpus-per-task=1             # Number of OpenMP threads
#SBATCH --output=%x.%j.out            # Standard output
#SBATCH --error=%x.%j.err             # Standard error

module load gompi


# Note: compile on arm compute node
mpicc -O2 -ftree-vectorize -march=native -fno-math-errno -o hello_mpi hello_mpi.c

# Run the program
mpirun -n 5 ./hello_mpi

