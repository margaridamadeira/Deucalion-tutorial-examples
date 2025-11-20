#!/bin/bash
## If you want to be updated by mail
#SBATCH --mail-user=mmadeira@ualg.pt
#SBATCH --mail-type=ALL

#SBATCH --job-name=exemplos          # Job name
#SBATCH --partition=normal-arm               # Partition to submit to
#SBATCH --account=F202500006HPCVLABUALGA
#SBATCH --nodes=1                     # Run on a single node
#SBATCH --ntasks=1                    # Only one task (OpenMP uses threads, not tasks)
#SBATCH --cpus-per-task=1             # Number of OpenMP threads
#SBATCH --output=%x.%j.out            # Standard output
#SBATCH --error=%x.%j.err             # Standard error

module load GCC/14.2.0

# compile all sources of exemplo*
# For real cases, consider addinf the following flags to the Makefile's CFLAGS
# -O2 -ftree-vectorize -march=native -fno-math-errnomake

# Run the program
make run

# Clean the space
make clean

module purge

