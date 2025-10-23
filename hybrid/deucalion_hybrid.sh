#!/bin/bash
## If you want to be updated by mail
#SBATCH --mail-user=mmadeira@ualg.pt
#SBATCH --mail-type=ALL

#SBATCH --job-name=hello_hybrid         # Job name
#SBATCH --partition=normal-arm          # Partition to submit to
#SBATCH --account=F202500006HPCVLABUALGA
#SBATCH --nodes=2                     # Run on a single node
#SBATCH --ntasks=6                    # Only one task (OpenMP uses threads, not tasks)
#SBATCH --cpus-per-task=5             # Number of OpenMP threads
#SBATCH --output=%x.%j.out            # Standard output
#SBATCH --error=%x.%j.err             # Standard error

module load gompi


# Note: compile on arm compute node
mpicc -O2 -fopenmp -ftree-vectorize -march=native -fno-math-errno -o hello_hybrid hello_hybrid.c

# Run the program
export OMP_NUM_THREADS=5
mpirun -n 6 ./hello_hybrid

