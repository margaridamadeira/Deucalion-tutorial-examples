#!/bin/bash
## If you want to be updated by mail
#SBATCH --mail-user=mmadeira@ualg.pt
#SBATCH --mail-type=ALL

#SBATCH --job-name=hello_hybrid         # Job name
#SBATCH --partition=normal-arm          # Partition to submit to
#SBATCH --account=F202500006HPCVLABUALGA
#SBATCH --nodes=2                     # Run on a single node
#SBATCH --ntasks=3                    # Only one task (OpenMP uses threads, not tasks)
#SBATCH --cpus-per-task=5             # Number of OpenMP threads
#SBATCH --output=%x.%j.out            # Standard output
#SBATCH --error=%x.%j.err             # Standard error

module load gompi


# Note: compile on arm compute node
mpicc -O2 -ftree-vectorize -march=native -fno-math-errno -o hello_hybrid hello_hybrid.c

# Run the program
# Note that although we declared 3 tasks, 6 were used in this run
export OMP_NUM_THREADS=5
mpirun -n 6 ./hello_hybrid


export NUM_THREADS=3

mpicc -fopenmp -o hello hello_hybrid.c  
mpirun --host localhost:4 -n 4 --oversubscribe ./hello

