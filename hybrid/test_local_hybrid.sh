#!/usr/bin/bash
export NUM_THREADS=3

mpicc -fopenmp -o hello hello_hybrid.c  
mpirun --host localhost:4 -n 4 --oversubscribe ./hello

