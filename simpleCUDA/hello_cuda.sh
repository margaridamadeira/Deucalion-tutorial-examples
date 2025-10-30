#!/bin/bash
## If you want to be updated by mail
#SBATCH --mail-user=mmadeira@ualg.pt
#SBATCH --mail-type=ALL

#SBATCH --job-name=hello_cuda   # Job name
#SBATCH --partition=normal-a100-40        # Partition to submit to
#SBATCH --account=F202500006HPCVLABUALGG
#SBATCH --nodes=1                     # Run on a single node
#SBATCH --ntasks=1                    # Only one task (OpenMP uses threads, not tasks)
#SBATCH --cpus-per-task=1             # Number of OpenMP threads
#SBATCH --gpus=1	              # 1 GPU A100
#SBATCH --time=00:05:00
#SBATCH --output=%x-%j.out
#SBATCH --error=%x-%j.err

ml CUDA/12.1.1

nvcc -o hello hello.cu

srun ./hello

