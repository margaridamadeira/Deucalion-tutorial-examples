#!/bin/bash
## If you want to be updated by mail
#SBATCH --mail-user=mmadeira@ualg.pt
#SBATCH --mail-type=ALL

#SBATCH --job-name=example_pthread          # Job name
#SBATCH --partition=normal-arm       # Partition to submit to
#SBATCH --account=F202500006HPCVLABUALGA
#SBATCH --nodes=1                     # Run on a single node
#SBATCH --ntasks=1                    # Only one task (OpenMP uses threads, not tasks)
#SBATCH --cpus-per-task=1             # Number of OpenMP threads
#SBATCH --output=%x.%j.out            # Standard output
#SBATCH --error=%x.%j.err             # Standard error

module load GCC/14.2.0

gcc -o example_pthread -pthread example_pthread.c 
# For real cases, consider using 
# gcc -O2 -ftree-parallelize-loops=n -ftree-vectorize -march=native -fno-math-errno 

# Run the program
time ./example_pthread

rm ./example_pthread

