#!/usr/bin/bash


mpirun --host localhost:4  -n 4  --oversubscribe echo Hello World!

mpicc -o hello hello_mpi.c  
mpirun --host localhost:4 -n 4 --oversubscribe ./hello

