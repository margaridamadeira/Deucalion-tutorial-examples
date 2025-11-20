#!/bin/bash
## If you want to be updated by mail
#SBATCH --mail-user=mmadeira@ualg.pt
#SBATCH --mail-type=ALL

#SBATCH --job-name=mm_4096_ijk          # Job name
#SBATCH --partition=normal-arm               # Partition to submit to
#SBATCH --account=F202500006HPCVLABUALGA
#SBATCH --nodes=1                     # Run on a single node
#SBATCH --ntasks=1                    # Only one task (OpenMP uses threads, not tasks)
#SBATCH --cpus-per-task=1             # Number of OpenMP threads
#SBATCH --output=%x.%j.out            # Standard output
#SBATCH --error=%x.%j.err             # Standard error

module load GCC/14.2.0


gcc -o mm_4096_ijk -O2 -ftree-vectorize -march=native -fno-math-errno mm_4096_ijk.c 
# for real code, consider using CFLAGS
# -O2 -ftree-vectorize -march=native -fno-math-errno 

# Run the program
./mm_4096_ijk

